
library(irr) #reilaibility stuff
library(openxlsx) #makes reading excel files easy

 
###read raw/native excel rating files and combine. Compute kappa for 2 raters

#read in data from native coding excels
data1 <- as.matrix(read.xlsx(xlsxFile = '/Users/jalexand/github/training-r/sample-darwin_coder1.xlsx',
                    sheet = 1, rows = c(5:14), cols = c(2:226), 
                    colNames = FALSE))
data2 <- as.matrix(read.xlsx(xlsxFile = '/Users/jalexand/github/training-r/sample-darwin_coder2.xlsx',
                             sheet = 1, rows = c(5:14), cols = c(2:226), 
                             colNames = FALSE))

#combine data files
allData <- rbind(data1, data2)

#transpose combined data
data_t <- as.data.frame(t(allData))

#select same variables of interest from each rater
mispron <- data_t[,c(1, 11)]
hesitat <- data_t[,c(6, 16)]
elong <- data_t[,c(7, 17)]


## compute kappa values representing inter-rater reliability among 2 raters
#mispron
kappa2(mispron)
#hesitat
kappa2(hesitat)
#elong
kappa2(elong)








###Fliess kappa for 3+ raters and using the "cheating" method of importing data

#read in modified data file (this is csv with multiple rater data combined and var names removed; cheating...)
data <- as.matrix(read.csv(file = '/Users/gbuzzell/Documents/Projects/rwe/sample-darwin_all.csv', header = FALSE))

#transpose data
data_t <- as.data.frame(t(data))


#just pulling out the var names...
dput(names(data_t))
#c("V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", 
"V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", 
"V20", "V21", "V22", "V23", "V24", "V25", "V26", "V27", "V28", 
"V29", "V30", "V31", "V32", "V33", "V34", "V35", "V36", "V37", 
"V38", "V39", "V40", "V41", "V42", "V43", "V44", "V45", "V46", 
"V47", "V48", "V49", "V50")

#select same variables of interest from each rater
mispron <- data_t[c("V1", "V11", "V21", "V31", "V41")]
hesitat <- data_t[c("V6", "V16", "V26", "V36", "V46")]
elong <- data_t[c("V7", "V17", "V27", "V37", "V47")]

## compute fleiss kappa values representing inter-rater reliability among 3+ raters
#mispron
kappam.fleiss(mispron)
#hesitat
kappam.fleiss(hesitat)
#elong
kappam.fleiss(elong)


