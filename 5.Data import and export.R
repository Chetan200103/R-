############# To get Current Working Directory #######
getwd()

#First  Method
data1 = read.csv(file.choose())

#Second  Method

data2 = read.csv("Auto.csv")

# Third Method
data3 = read.csv("C:/Users/Chetan Habib/Desktop/R File/Auto.csv")

################ Data export into csv

write.csv(data1, file="C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/Demo.csv",row.names=FALSE)

######Importing Excel file data 
library(openxlsx)

data4<-read.xlsx("C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/demo.xlsx")

write.xlsx(data1, file="C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/try.xlsx",row.names=FALSE)




# to read txt file
data <- read.delim(file.choose())

# to write the txt file
write.table(df, file = "abc.txt")


