############## Data Import #######################

prc=read.csv("C:/Users/User/Desktop/Python Code/R and Data Science/Knn/Prostate_Cancer.csv")

############## Data type and column names  #######################

str(prc)
names(prc)

prc$diagnosis_result = as.factor(prc$diagnosis_result)

############## Removing irreleavent column and  #######################

prc$id = NULL

############## Min-Max Normalization  #######################
# it bring every call under the range of 0 to 1

Min_max = function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

summary(prc$radius)

prc[2:9] = as.data.frame(lapply(prc[2:9], Min_max))

summary(prc$radius)
summary(prc$texture)

###############################################################################
############## Method 2 = k fold  ############################################# 
###############################################################################

############### Data Partition ########################
set.seed(123)
library(caret)
Train = createDataPartition(prc$diagnosis_result, p=0.7, list=FALSE)
training = prc[ Train, ]
testing = prc[ -Train, ]

############## Model Building ##############

#method = "center"(x-mean(x)) 
#method = "scale" (x-mean(x))/standard deviation.
library(e1071)
trctrl = trainControl(method = "repeatedcv", number = 10, repeats = 3)

set.seed(123)
knn_fit = train(diagnosis_result ~ ., data = training, method = "knn",
                trControl=trctrl,
                preProcess = c("center", "scale"),
                tuneGrid = expand.grid(k = c(5, 11, 21, 25,15)))  ## manual K value
#tuneLength = 15) # System take random 15 value

############ To get the Best Model ############
knn_fit

plot(knn_fit)

############## Model Prediction testing data #######################

testing$predicted = predict(knn_fit,testing)

############## Model Performance on testing data #######################

confusionMatrix(testing$predicted, testing$diagnosis_result,positive = "M")

