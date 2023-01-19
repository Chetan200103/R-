############## Import Data  #####################

data=read.csv("C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/Missing_File.csv")

###################### verifing for missing values #####################
summary(data)

sapply(data,function(x) sum(is.na(x)))

###################### Deleting the observation #####################

data1 = na.omit(data)  # though na.omit max to max 5% data 

sapply(data1,function(x) sum(is.na(x)))

rm(data,data1)
##################### imputation with mean/ median/ mode #####################

data=read.csv("C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/Missing_File.csv")

sapply(data,function(x) sum(is.na(x)))

library(Hmisc)

data$wt = impute(data$wt, mean)  # replace with mean
data$drat = impute(data$drat, median)  # median

library(modeest)
mfv(data$vs,na_rm = TRUE)

data$vs = impute(data$vs, mfv)  # replace with mode

summary(data$vs)
sapply(data, function(x) sum(is.na(x)))
