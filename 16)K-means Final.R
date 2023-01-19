############################################################################
################### K-means clustering ######################################
############################################################################

library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(NbClust)


################### Import data ##########################
trip_advisor = read.csv("C:/Users/USER/Desktop/Python Code/R and Data Science/Clustering/Feedback data/tripadvisor_review.csv")

################## Removing unnecessay column ############

trip_advisor_final = trip_advisor[-c(1)]

summary(trip_advisor_final)

####################### K-Means Model== Random K value ########################

k2 = kmeans(trip_advisor_final, centers = 5, nstart = 100)

k2$centers

fviz_cluster(k2, data = trip_advisor_final)

############################# Elbow chart ################################## 
mydata = trip_advisor_final

wss = (nrow(mydata)-1)*sum(apply(mydata,2,var))

for (i in 2:15) wss[i] = sum(kmeans(mydata,centers=i)$withinss)

plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares",col="mediumseagreen",pch=12)


####################### K-Means Model== using Elbow ########################

k1 = kmeans(trip_advisor_final, centers = 2, nstart = 25)

######################### Centroid  #########################

k1$centers

######################### Cluster Prediction #########################

trip_advisor$cluster=k1$cluster
View(trip_advisor)

table(trip_advisor$cluster)


fviz_cluster(k1, data = trip_advisor_final)


####################### Business Submission ##########################

Final_Output = trip_advisor[,c(1,12)]
View(Final_Output)
