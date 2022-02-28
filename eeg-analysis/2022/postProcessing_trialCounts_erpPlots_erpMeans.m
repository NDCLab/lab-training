%
% This script was created by George Buzzell for the NDC Lab EEG Training
% Workshop on 02/22. This script uses parts of the "set up" structure from
% the MADE preprocessing pipeline (Debnath, Buzzell, et. al., 2020)

clear % clear matlab workspace
clc % clear matlab command window

%% setup; run this section before any other section below

% MUST EDIT THIS
%running in "EEG_training" folder on your computer
main_dir = '/Users/gbuzzell/Documents/EEG_training';

% Setting up other things

%Location of MADE and ADJUSTED-ADJUST scripts
addpath(genpath([main_dir filesep 'MADE-EEG-preprocessing-pipeline']));% enter the path of the EEGLAB folder in this line

%Location of "EEG
addpath(genpath([main_dir filesep 'eeglab13_4_4b']));% enter the path of the EEGLAB folder in this line

%remove path to octave functions inside matlab to prevent errors when
rmpath([main_dir filesep 'eeglab13_4_4b' filesep 'functions' filesep 'octavefunc' filesep 'signal'])

% 1. Enter the path of the folder that has the data to be analyzed
data_location = [main_dir filesep 'Data' filesep 'Processed_Data' filesep 'processed_Data'];

% 2. Enter the path of the folder where you want to save the processed data
output_location = [main_dir filesep 'Data' filesep 'Processed_Data' filesep 'processed_Data'];

% 3. Enter the path of the channel location file
channel_locations = [main_dir filesep 'Data' filesep 'Raw_Data_Info' filesep 'standard-10-5-cap385.elp'];

% 4. Markers
stimulus_markers = {'11', '12', '21', '22'};     
respose_markers = {'111', '112', '121', '122','211', '212', '221', '222'};     

% Read files to analyses
datafile_names=dir([data_location filesep '*_ERN_processed_data.set']);
datafile_names=datafile_names(~ismember({datafile_names.name},{'.', '..', '.DS_Store'}));
datafile_names={datafile_names.name};
[filepath,name,ext] = fileparts(char(datafile_names{1}));

% Check whether EEGLAB and all necessary plugins are in Matlab path.
if exist('eeglab','file')==0
    error(['Please make sure EEGLAB is on your Matlab path. Please see EEGLAB' ...
        'wiki page for download and instalation instructions']);
end

% Create output folders to save data
if exist([output_location filesep 'processed_data'], 'dir') == 0
    mkdir([output_location filesep 'processed_data'])
end


%% Count trials

% switch to output directory
cd(output_location);

%create variable names for count trials output and write to disk
outputHeader = {'id, resp_incon_error, resp_incon_corr, stim_con_corr, stim_incon_corr'};
dlmwrite(strcat('erpCore_trialCounts_example_', date, '.csv'), outputHeader, 'delimiter', '', '-append');

for subject=1:length(datafile_names)
    EEG=[];
    
    fprintf('\n\n\n*** Processing subject %d (%s) ***\n\n\n', subject, datafile_names{subject});
    
    %load in raw data that is alread in eeglab (.set) format)
    EEG = pop_loadset( 'filename', datafile_names{subject}, 'filepath', data_location);
    EEG = eeg_checkset(EEG);
    
    %convert subject name to number
    subIdNum = str2double(datafile_names{subject}(1)); %this will only work for #1-9, need nuanced code to pull out numbers better...
        
    %remove all the non-stim-locking markers (should have done already...)
    EEG = pop_selectevent( EEG, 'latency','-.1 <= .1','deleteevents','on');
	EEG = eeg_checkset( EEG );
    
    %count how many of each event type (combination of event types) of
    %interest are present
    resp_incon_error = length(find( ([EEG.event.EventType] == 2) & ([EEG.event.Congruency] == 0) & ([EEG.event.Accuracy] == 0) & ([EEG.event.Responded] == 1) & ([EEG.event.ValidRt] == 1)  ));                   
    resp_incon_corr  = length(find( ([EEG.event.EventType] == 2) & ([EEG.event.Congruency] == 0) & ([EEG.event.Accuracy] == 1) & ([EEG.event.Responded] == 1) & ([EEG.event.ValidRt] == 1)  ));                   
    stim_con_corr    = length(find( ([EEG.event.EventType] == 1) & ([EEG.event.Congruency] == 1) & ([EEG.event.Accuracy] == 1) & ([EEG.event.Responded] == 1) & ([EEG.event.ValidRt] == 1)  ));                   
    stim_incon_corr  = length(find( ([EEG.event.EventType] == 1) & ([EEG.event.Congruency] == 0) & ([EEG.event.Accuracy] == 1) & ([EEG.event.Responded] == 1) & ([EEG.event.ValidRt] == 1)  ));                   

    %format trial counts into output vector
    output = [subIdNum, resp_incon_error, resp_incon_corr, stim_con_corr, stim_incon_corr];
    
    %write to disk the trial counts for this participant
    dlmwrite(strcat('erpCore_trialCounts_example_', date, '.csv'), output, 'delimiter', ',', '-append');
end


%% pull erp mat file

%this list can be created automatically by additional code that searches
%the trial counts file, etc. Here, just hard coding (presumably based on
%manual inspection of trial counts file and other notes/parameters)
subjects = [1];

%initialize participant counter variable (used for indexing into large mat
%file that data is saved into)
pIdx = 0;

%array to store erp data (participants x conditions x channels x samples of avg epoch data)
erpCore_erpDat_example = zeros(length(subjects),2,30,768);

% loop through each participant in the study
for i = subjects
    
    pIdx = pIdx + 1;

    % convert the integer participant number to a string
    sText = int2str(i);

     %load the original data set
    EEG = pop_loadset('filename', strcat(sText,'_ERN_processed_data.set'), 'filepath', strcat(data_location) );
    EEG = eeg_checkset( EEG );
    
    %remove all the non-stim-locking markers (should have done already...)
    EEG = pop_selectevent( EEG, 'latency','-.1 <= .1','deleteevents','on');
	EEG = eeg_checkset( EEG );
    
    %make selections common to all conditions (responded, validRT)
    
    % select only the epochs with responses
    EEG = pop_selectevent( EEG, 'latency','-1<=1','Responded',1,'deleteevents','on','deleteepochs','on','invertepochs','off');
    EEG = eeg_checkset( EEG );

    % select only the epochs with valid RTs
    EEG = pop_selectevent( EEG, 'latency','-1<=1','ValidRt',1,'deleteevents','on','deleteepochs','on','invertepochs','off');
    EEG = eeg_checkset( EEG );

    % loop through four conditions (combinations of event types)
    for c = 1:4

        if (c==1)
            EventType  = 2;
            Congruency = 0;
            Accuracy   = 0; 
        elseif (c==2) 
            EventType  = 2;
            Congruency = 0;
            Accuracy   = 1; 
        elseif (c==3) 
            EventType  = 1;
            Congruency = 1;
            Accuracy   = 1; 
        elseif (c==4) 
            EventType  = 1;
            Congruency = 0;
            Accuracy   = 1; 
        end
   
        %select combintion of event types of interest based on vars above
        EEG1 = pop_selectevent( EEG, 'latency','-1<=1','EventType',EventType,'deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG1 = eeg_checkset( EEG1 );
        
        EEG1 = pop_selectevent( EEG1, 'latency','-1<=1','Congruency',Congruency,'deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG1 = eeg_checkset( EEG1 );
        
        EEG1 = pop_selectevent( EEG1, 'latency','-1<=1','Accuracy',Accuracy,'deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG1 = eeg_checkset( EEG1 );
  
        % Average across epoch dimension
        % this all Channel ERP only needs to be computed once
        % per condition
        meanEpochs = mean(EEG1.data, 3);
        
        %store data for this condition in array
        erpCore_erpDat_example(pIdx,c,:,:)= meanEpochs;
        
    %end loop through conditions
    end
 
%end loop through participants
end

%save the erps and subject list
save('erpCore_erps_example.mat','erpCore_erpDat_example', 'subjects')




%% Plot ERPs!!

%load the mat file that has the erps and subject list
load('erpCore_erps_example.mat')

%make a copy/rename the erp matrix 
allData = erpCore_erpDat_example;

%load in one of the participants EEGLAB-formatted data; this is to load
%parameters needed for plotting (sampling rate, chanlocs, etc).
EEG = pop_loadset( 'filename', datafile_names{1}, 'filepath', data_location);
EEG = eeg_checkset(EEG);

%round EEG.times to nearest whole ms to make easier to work with
EEG.times = round(EEG.times);

%setup for baseline correcting the ERP data (always done before plotting or extracting
%erps, not done to the data previously to allow use of different baselines
%as a function of review comments)
startTime = -400; %(in ms)
endTime = -200 ; %(in ms)

%find closest values in (rounded) EEG.times to the specified start/stop
[temp,startIdx] = min(abs(EEG.times-startTime));
[temp2,endIdx] = min(abs(EEG.times-endTime));

%baseline corrections
range = startIdx:endIdx;
allBase = squeeze(mean(allData(:,:,:,range),4));
allBase = mean(allData(:,:,:,range),4);

for i=1:size(allData,4)
    newData(:,:,:,i) = allData(:,:,:,i) - allBase;
end

%select channel(s) to plot: frontocentral cluster
chan = (newData(:,:,[17 21 22],:));
chan = mean(chan,3);

%pull out four conditions of interest for all subs
resp_incon_error = chan(:,1,:,:);
resp_incon_corr = chan(:,2,:,:);

%average across subs
resp_incon_errorMean = squeeze(mean(resp_incon_error,1));
resp_incon_corrMean = squeeze(mean(resp_incon_corr,1));

%label for plot and define colors for plot
blue = [0  0 1];
red = [1 0 0];

%plot the two response-related erps
figure;
hold on
plot(EEG.times, resp_incon_errorMean, 'color', red, 'LineWidth', 1.5);
plot(EEG.times, resp_incon_corrMean, 'color', blue, 'LineWidth', 1.5);
%title(sprintf('Fz'), 'FontSize', 30);
legendHandle = legend('Error', 'Correct');
set(legendHandle, 'box', 'off', 'FontSize', 26);
hold off;

% set parameters
plotStartTime = -400; %(in ms)
plotEndTime = 600 ; %(in ms)
set(gcf, 'Color', [1 1 1]);
set(gca, 'YLim', [-9 6]);
set(gca, 'XLim', [plotStartTime plotEndTime]);
set(gca, 'FontSize', 20);
set(get(gca, 'YLabel'), 'String', 'Amplitude in  \muV', 'FontSize', 26);
set(get(gca, 'XLabel'), 'String', 'Time Relative to Response (ms)', 'FontSize', 26);
set(gca, 'Box', 'off');
set(gcf, 'Position', [0 0 1440 900]);



%% Plot topos!!

%load the mat file that has the erps and subject list
load('erpCore_erps_example.mat')

%make a copy/rename the erp matrix 
allData = erpCore_erpDat_example;

%load in one of the participants EEGLAB-formatted data; this is to load
%parameters needed for plotting (sampling rate, chanlocs, etc).
EEG = pop_loadset( 'filename', datafile_names{1}, 'filepath', data_location);
EEG = eeg_checkset(EEG);

%round EEG.times to nearest whole ms to make easier to work with
EEG.times = round(EEG.times);

%setup for baseline correcting the ERP data (always done before plotting or extracting
%erps, not done to the data previously to allow use of different baselines
%as a function of review comments)
startTime = -400; %(in ms)
endTime = -200 ; %(in ms)

%find closest values in (rounded) EEG.times to the specified start/stop
[temp,startIdx] = min(abs(EEG.times-startTime));
[temp2,endIdx] = min(abs(EEG.times-endTime));

%baseline corrections
range = startIdx:endIdx;
allBase = squeeze(mean(allData(:,:,:,range),4));
allBase = mean(allData(:,:,:,range),4);

for i=1:size(allData,4)
    newData(:,:,:,i) = allData(:,:,:,i) - allBase;
end

%start and end time range for component of interest
compStartTime = 0; %(in ms)
compEndTime = 100 ; %(in ms)

%find closest values in (rounded) EEG.times to the specified start/stop
[temp,compStartIdx] = min(abs(EEG.times-compStartTime));
[temp2,compEndIdx] = min(abs(EEG.times-compEndTime));

%idxs of time range to plot topo for
compRange = compStartIdx:compEndIdx;

%pull out conditions of interest for all subs, and average over time
%range of interest
resp_incon_error = mean(newData(:,1,:,compRange),4);
resp_incon_corr = mean(newData(:,2,:,compRange),4);

%average across subs
resp_incon_errorMean = squeeze(mean(resp_incon_error,1));
resp_incon_corrMean = squeeze(mean(resp_incon_corr,1));

%compute difference topo
resp_incon_errorMean_diff = resp_incon_errorMean - resp_incon_corrMean;

%plot topos
figure
topoplot(resp_incon_errorMean, EEG.chanlocs, 'maplimits', [-6 6], 'electrodes', 'on', 'gridscale', 300)
set(get(gca, 'title'), 'String', 'Error (0-100 ms)', 'FontSize', 20);

figure
topoplot(resp_incon_corrMean, EEG.chanlocs, 'maplimits', [-6 6], 'electrodes', 'on', 'gridscale', 300)
set(get(gca, 'title'), 'String', 'Correct (0-100 ms)', 'FontSize', 20);

figure
topoplot(resp_incon_errorMean_diff, EEG.chanlocs, 'maplimits', [-6 6], 'electrodes', 'on', 'gridscale', 300)
set(get(gca, 'title'), 'String', 'Error Minus Correct (0-100 ms)', 'FontSize', 20);




%% Extract mean component amplitudes (for statistics)

%clear output
output = [];

%create variable names for count trials output and write to disk
outputHeader = {'id, ERN, CRN, deltaERN'};
dlmwrite(strcat('erpCore_compMeans_example_', date, '.csv'), outputHeader, 'delimiter', '', '-append');

%define electrodes average over for component
compCluster = [17 21 22]; 

%define timeRange to average over for component 
compTime = [0 100]; 

%load the mat file that has the erps and subject list
load('erpCore_erps_example.mat')

%make a copy/rename the erp matrix 
allData = erpCore_erpDat_example;

%load in one of the participants EEGLAB-formatted data; this is to load
%parameters needed for plotting (sampling rate, chanlocs, etc).
EEG = pop_loadset( 'filename', datafile_names{1}, 'filepath', data_location);
EEG = eeg_checkset(EEG);

%round EEG.times to nearest whole ms to make easier to work with
EEG.times = round(EEG.times);

%setup for baseline correcting the ERP data (always done before plotting or extracting
%erps, not done to the data previously to allow use of different baselines
%as a function of review comments)
startTime = -400; %(in ms)
endTime = -200 ; %(in ms)

%find closest values in (rounded) EEG.times to the specified start/stop
[temp,startIdx] = min(abs(EEG.times-startTime));
[temp2,endIdx] = min(abs(EEG.times-endTime));

%baseline corrections
range = startIdx:endIdx;
allBase = squeeze(mean(allData(:,:,:,range),4));
allBase = mean(allData(:,:,:,range),4);

for i=1:size(allData,4)
    newData(:,:,:,i) = allData(:,:,:,i) - allBase;
end

%start and end time range for component of interest
compStartTime = compTime(1); %(in ms)
compEndTime = compTime(2) ; %(in ms)

%find closest values in (rounded) EEG.times to the specified start/stop
[temp,compStartIdx] = min(abs(EEG.times-compStartTime));
[temp2,compEndIdx] = min(abs(EEG.times-compEndTime));

%idxs of time range to plot topo for
compRange = compStartIdx:compEndIdx;

%pull out conditions of interest for all subs, and average over time
%range of interest
resp_incon_error_avgTime = mean(newData(:,1,:,compRange),4);
resp_incon_corr_avgTime = mean(newData(:,2,:,compRange),4);

%average cluster of interest
resp_incon_error_avgTimeClust = mean(resp_incon_error_avgTime(:,:,compCluster),3);
resp_incon_corr_avgTimeClust = mean(resp_incon_corr_avgTime(:,:,compCluster),3);

%compute difference scores
resp_incon_error_avgTimeClust_diff = resp_incon_error_avgTimeClust - resp_incon_corr_avgTimeClust;

%write sub numbers to ouput
output(:,1) = subjects';

%write component means to output
output(:,2) = resp_incon_error_avgTimeClust;
output(:,3) = resp_incon_corr_avgTimeClust;
output(:,4) = resp_incon_error_avgTimeClust_diff;
        
%write component means to disk
dlmwrite(strcat('erpCore_compMeans_example_', date, '.csv'), output, 'delimiter', ',', '-append');
