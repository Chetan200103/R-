library(caret) # data partition & confusion matrix
library(e1071) # model 

################### Importing data ##################
heart_df = read.csv("C:/Users/User/Desktop/Python Code/R and Data Science/Svm/heart.csv")

################### To check Data Type ##################
names(heart_df)
str(heart_df)

################## Data Conversion#############################

# Taken All integar variable &  convert to numeric
heart_df1 = subset(heart_df, select = -c(2,3,6,7,9,13,14))
names(heart_df1)
str(heart_df1)

heart_df1= data.frame(apply(heart_df1, 2, as.numeric))
str(heart_df1)

# Taken all categorical variable
heart_df2 = subset(heart_df, select = c(2,3,6,7,9,13,14))
str(heart_df2)

library(dplyr)
heart_df2 =  heart_df2 %>% mutate_if(is.integer,as.factor)
str(heart_df2)

# combined Numeric &categorical Variable 
heart_df= data.frame(heart_df2,heart_df1)
str(heart_df)
names(heart_df)

############### Data Partition ########################
set.seed(231)
library(caret)
train= createDataPartition(heart_df$target,p=0.7,list=FALSE)
training= heart_df[train,]
testing= heart_df[-train,]


###### summary and checking missing value
summary(training)
sapply(training,function(x) sum(is.na(x)))

############### Building model #########################
svm_model1 =  svm(target ~ ., data=training,cost=0.01,scale=FALSE)
summary(svm_model1)

########### Accuracy of model on training data ###########
confusionMatrix(svm_model1$fitted, training$target ,positive = "1")

############## Prediction ###########
testing$Prediction= predict(svm_model1,testing)

############ Accuracy of model on test data ###########
confusionMatrix(testing$Prediction, testing$target,positive = "1" )


####### how to increase the accuracy of the model =0.1 or 100 ###############
tune.out=tune(svm,target ~ .,data=training ,kernel ="linear",
              ranges =list(cost=c(0.001 , 0.01, 0.1, 1,5,10,100)))
summary (tune.out)

####### Best model ################
bestmod=tune.out$best.model
summary (bestmod )

########### accuracy of model on training data
confusionMatrix(bestmod$fitted,training$target,positive = "1")

################ Prediction on testing ################
testing$Prediction= NULL

testing$Prediction=predict (bestmod,testing)

################# Accuracy of model on test data ################
confusionMatrix(testing$Prediction,testing$target,positive = "1")
