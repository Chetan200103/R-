mtcars = mtcars

################### Capping and Flooring Technique ##########################
summary(mtcars$hp)
boxplot(mtcars$hp)

library(scales)

round(quantile(mtcars$hp, c(0.05, 0.95)))

mtcars$hp = squish(mtcars$hp, round(quantile(mtcars$hp, c(0.05, 0.95))))

summary(mtcars$hp)
boxplot(mtcars$hp)

rm(mtcars)

#################  winsorizing  Technique ###############
mtcars = mtcars

summary(mtcars$hp)
par(mfrow=c(1,2))
boxplot(mtcars$hp,main="Before Treatment")

#### upper limit value
upper = 180+1.5*IQR(mtcars$hp)
upper

##### lower limit value
lower = 96.5-1.5*IQR(mtcars$hp)
lower

##### upper limit replacement

mtcars$hp = ifelse(mtcars$hp > upper,upper,mtcars$hp)
summary(mtcars$hp)
boxplot(mtcars$hp,main="After Treatment")

##### lower limit replacement
mtcars$hp = ifelse(mtcars$hp < lower,lower,mtcars$hp)
summary(mtcars$hp)

rm(mtcars)

################## Row Deletion / Subset data ############
mtcars = mtcars

summary(mtcars$hp)
par(mfrow=c(1,2))
boxplot(mtcars$hp,main="Before Treatment")

abc = subset(mtcars,mtcars$hp<=305.25)  

boxplot(abc$hp,main="After Treatment")

rm(mtcars)

########## Replace by mean / Median/ Mode ##################
mtcars = mtcars

summary(mtcars$hp)
par(mfrow=c(1,2))
boxplot(mtcars$hp,main="Before Treatment")

mean(abc$hp)

mtcars$hp = ifelse(mtcars$hp > 305.25,mean(abc$hp),mtcars$hp)
summary(mtcars$hp)
boxplot(mtcars$hp,main="After Treatment")

rm(mtcars)
