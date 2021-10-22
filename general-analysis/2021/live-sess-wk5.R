
# Gen Analysis Working Group - Week 5

#create matrix where we will store summary data
summaryDat = matrix(data = NA, nrow = 1, ncol = 9)

#read in flanker data from pavlovia fiu-toolbox task
flankerDat <- read.csv(file = '/Users/gbuzzell/Documents/gen-analysis-work-group/example_data/ft-flanker-o_s1_r1_e1_146668_2021-10-08_10/4_ft-flanker-o_s1_r1_e1_2021-06-28_17h09.58.017.csv', stringsAsFactors = TRUE)

#let's make that more modular...
path <- '/Users/gbuzzell/Documents/gen-analysis-work-group/example_data/ft-flanker-o_s1_r1_e1_146668_2021-10-08_10/'
filename <- '4_ft-flanker-o_s1_r1_e1_2021-06-28_17h09.58.017'
ext <- '.csv'
paste(path,filename,ext, sep = "", collapse = NULL)
flankerDat <- read.csv(file = paste(path,filename,ext, sep = "", collapse = NULL), stringsAsFactors = TRUE)

#let's get a list of the var names
dput(names(flankerDat))

#c("key_resp_10.keys", "key_resp_10.rt", "key_resp_5.keys", "key_resp_5.rt", 
# "key_resp_6.keys", "key_resp_6.rt", "key_resp_7.keys", "key_resp_7.rt", 
# "key_resp_8.keys", "key_resp_8.rt", "key_resp_11.keys", "key_resp_11.rt", 
# "key_resp_16.keys", "key_resp_16.rt", "ISI", "key_resp_2.keys", 
# "key_resp_2.corr", "key_resp_2.rt", "trials.thisRepN", "trials.thisTrialN", 
# "trials.thisN", "trials.thisIndex", "trials.ran", "left_arrow", 
# "right_arrow", "empty", "middle", "corrAns", "participant", "session", 
# "date", "expName", "psychopyVersion", "OS", "frameRate", "id", 
# "key_resp_18.keys", "key_resp_18.rt", "block.thisRepN", "block.thisTrialN", 
# "block.thisN", "block.thisIndex", "block.ran", "key_resp_9.keys", 
# "key_resp_9.rt", "test_trials.thisRepN", "test_trials.thisTrialN", 
# "test_trials.thisN", "test_trials.thisIndex", "test_trials.ran"
# )

#remove practice trials and any rows that do not reflect experiment data
testDat <- subset(flankerDat, complete.cases(flankerDat$test_trials.thisN))

#create a vector of vars we want to keep
selectedCols <- c("ISI", "key_resp_2.keys", 
  "key_resp_2.corr", "key_resp_2.rt", "left_arrow", 
  "right_arrow", "empty", "middle", "corrAns", "participant", "session", 
  "date", "expName", "psychopyVersion", "OS", "frameRate", "id", "test_trials.thisTrialN")

#remove unwanted vars from data frame
testDatTrim <- testDat[selectedCols]


#Identify the incongruent and congruent trials
#Note: first had to identify that testDatTrim$congruent is a factor and what the levels correspond to...
testDatTrim$congruent <- with(testDatTrim, as.numeric(testDatTrim$middle) < 4 )
#we now have a new variable "congruent" that is "TRUE" for congruent trials and "FALSE for incongruent trials

#subset the data for congruent and incongruent trials, creating new data frames for each
testDatTrim_con <- testDatTrim[testDatTrim$congruent, ]
testDatTrim_incon <- testDatTrim[!testDatTrim$congruent, ] #note that we take the inverse of "congruent" here to get incongruent

#compute mean incongruent and congruent accuracy
con_Acc_mean <- mean(testDatTrim_con$key_resp_2.corr)
incon_Acc_mean <- mean(testDatTrim_incon$key_resp_2.corr)

#subset the data for correct trials only, separately for congruent and incongruent trials, creating new data frames for each
testDatTrim_conCorr <- testDatTrim_con[testDatTrim_con$key_resp_2.corr==1, ]
testDatTrim_inconCorr <- testDatTrim_incon[testDatTrim_incon$key_resp_2.corr==1, ]

#For correct trials, compute mean incongruent and congruent RT WITHOUT log scaling
conCorr_RT_mean <- mean(testDatTrim_conCorr$key_resp_2.rt)
inconCorr_RT_mean <- mean(testDatTrim_inconCorr$key_resp_2.rt)

#For correct trials, compute mean incongruent and congruent RT WITH log scaling
conCorr_logRT_mean <- mean(log((1+testDatTrim_conCorr$key_resp_2.rt))) #note that we add 1 first before taking log to avoid negative log values
inconCorr_logRT_mean <- mean(log((1+testDatTrim_inconCorr$key_resp_2.rt))) #note that we add 1 first before taking log to avoid negative log values

#compute flanker-effect scores for accuracy, RT, log-RT
flankEff_Acc <- incon_Acc_mean-con_Acc_mean
flankEff_RT <- inconCorr_RT_mean-conCorr_RT_mean
flankEff_logRT <- inconCorr_logRT_mean-conCorr_logRT_mean

#store data in summary matrix
summaryDat[1, ] <- c(con_Acc_mean, incon_Acc_mean, conCorr_RT_mean, inconCorr_RT_mean, conCorr_logRT_mean, inconCorr_logRT_mean, flankEff_Acc, flankEff_RT, flankEff_logRT)



