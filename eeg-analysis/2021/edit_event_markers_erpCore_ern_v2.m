%

%%%%%% Label event markers%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script labels the congruency, accuracy and validity of stim and
% response markers for the erpcore ern dataset
%
% This script was created by George Buzzell for the NDC Lab EEG Training
% Workshop on 11/7.
%


%% event codes
					
% Stimulus Event Codes						
% 						
% Flanker Type	tens place	Target Type	ones place	Event Code		
% compatible	1	left	1	11		
% compatible	1	right	2	12		
% incompatible	2	left	1	21		
% incompatible	2	right	2	22		
% 						
% Response Event Codes						
% 						
% Response Hand	hundreds place	Flankers Type	tens place	Target Direction	ones place	Event Code
% left	1	compatible	1	left	1	111
% left	1	compatible	1	right	2	112
% left	1	incompatible	2	left	1	121
% left	1	incompatible	2	right	2	122
% right	2	compatible	1	left	1	211
% right	2	compatible	1	right	2	212
% right	2	incompatible	2	left	1	221
% right	2	incompatible	2	right	2	222

% create array with stim markers
stimMarkers = {'11', '12', '21', '22'};

%%
% Add labels to the event structure for: EventType, Congruency, Responded, Accuracy
EEG = pop_editeventfield( EEG, 'indices',  strcat('1:', int2str(length(EEG.event))), 'EventType','NaN');
EEG = eeg_checkset( EEG );

EEG = pop_editeventfield( EEG, 'indices',  strcat('1:', int2str(length(EEG.event))), 'Congruency','NaN');
EEG = eeg_checkset( EEG );

EEG = pop_editeventfield( EEG, 'indices',  strcat('1:', int2str(length(EEG.event))), 'Responded','NaN');
EEG = eeg_checkset( EEG );

EEG = pop_editeventfield( EEG, 'indices',  strcat('1:', int2str(length(EEG.event))), 'ValidRt','NaN');
EEG = eeg_checkset( EEG );

EEG = pop_editeventfield( EEG, 'indices',  strcat('1:', int2str(length(EEG.event))), 'Accuracy','NaN');
EEG = eeg_checkset( EEG );

%loop through all stim events and label stim/response events
for i = 1:length(stimMarkers)
    
    % find event indices corresponding to the ith stim marker
    events = find(strcmp({EEG.event.type}, stimMarkers{i}));

    %loop over (j) the event indices corresponding the ith stim marker
    for j = events
          
        %label the event marker as stimulus in eventType 
        EEG.event(j).EventType = 1;
        
        %label congruency
        if str2double(EEG.event(j).type) < 20 %if congruent (markers less than 20)
            
            %label stim marker as congruent
            EEG.event(j).Congruency = 1;
            
            %if a response occured (marker 100 or greater following stim marker)
            if str2double(EEG.event(j+1).type) > 99
                
                %label resp marker as congruent
                EEG.event(j+1).Congruency = 1;
                
            end
                
        else
            
            %label stim marker as incongruent
            EEG.event(j).Congruency = 0;
            
            %if a response occured (marker 100 or greater following stim marker)
            if str2double(EEG.event(j+1).type) > 99

                %label resp marker as incongruent
                EEG.event(j+1).Congruency = 0;
                
            end

        end        
    
        %if a response occured (marker 100 or greater following stim marker)
        if str2double(EEG.event(j+1).type) > 99
            
            %label the event marker as response in eventType 
            EEG.event(j+1).EventType = 2;
            
            % label whether response occured (it did)
            EEG.event(j).Responded = 1;
            EEG.event(j+1).Responded = 1;
            
            % label accuracy
            if ( str2double(EEG.event(j).type) == 11 || str2double(EEG.event(j).type) == 21 ) % if a left target stim
            
                if  str2double(EEG.event(j+1).type) > 199 % if a right hand response (error)
                    EEG.event(j).Accuracy = 0;
                    EEG.event(j+1).Accuracy = 0;
               
                elseif  str2double(EEG.event(j+1).type) < 200 % if a left hand response (correct)
                    EEG.event(j).Accuracy = 1;
                    EEG.event(j+1).Accuracy = 1;
                    
                end
                
            elseif ( str2double(EEG.event(j).type) == 12 || str2double(EEG.event(j).type) == 22 ) % if a right target stim
                           
                if  str2double(EEG.event(j+1).type) > 199 % if a right hand response (correct)
                    EEG.event(j).Accuracy = 1;
                    EEG.event(j+1).Accuracy = 1;
               
                elseif  str2double(EEG.event(j+1).type) < 200 % if a left hand response (error)
                    EEG.event(j).Accuracy = 0;
                    EEG.event(j+1).Accuracy = 0;
                    
                end
                
            end
             
            %label response validity
            if ( (EEG.event(j+1).latency - EEG.event(j).latency) * (1000/EEG.srate) ) > 150  %if response RT valid
               
                %label as valid rt
                EEG.event(j).ValidRt = 1;
                EEG.event(j+1).ValidRt = 1;
           
            else %if response RT not valid
                
                %label as invalid rt
                EEG.event(j).ValidRt = 0;
                EEG.event(j+1).ValidRt = 0;
           
            end
            
        else % if a response did not occur
            
            %label whether response occured (did not occur)
            EEG.event(j).Responded = 0;
            EEG.event(j+1).Responded = 0;
            
        end
        
    end
    
end