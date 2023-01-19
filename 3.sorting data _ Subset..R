#### sorting examples using the abc dataset
data()   ### it will give in-built dataset

abc = mtcars
names(abc)
View(abc)  # V is Capital letter
str(abc)  # structure of dataset

######### it is used to fixed dataset

mpg          # search only in enviroment
attach(abc)  # fixed
mpg         # Search inside abc 

######### data visual
head(abc)       # by default 6 rows
head(abc,3)  # n = 10 ( observations)
tail(abc)
tail(abc,3)

summary(abc)
summary(abc$mpg)  # dataset $ column

## selcting cell
abc[3,1]     # [Row , column]

################# Selecting Row ################# 
a = abc[1,]
a

a = abc[1:5,]
a

a = abc[c(1,4,10)   , ]
a

################## Selecting column ################# 
a = abc[ , 1]
a

a = abc[ , 9:11]
a

a = abc[ ,c(1,4,8)]
a


#################### Selecting row and column ################# 
a = abc[1:3,2:5]
a

a = abc[c(1,4,10),c(1,2,4)]
a

###################### Column by its name  ####################
a = abc[ ,"mpg"]
a

a = abc[ ,c("mpg","hp")]
a

abc = mtcars
attach(abc)

############### sorting = Ascending ###############
newdata = abc [order(mpg),] 

# sort by mpg and cyl
#newdata = abc[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata = abc[order(-mpg),] 

detach(abc)

############  Dropping / Delete Variable  ############

######### delete one variables

newdata$mpg = NULL
newdata$cyl = NULL

newdata = abc

# exclude 3rd and 5th variable 
newdata1 = newdata[ , c(-1,-3)]  # by default

newdata1 = newdata[ ,-c(1,3)]

rm(newdata,newdata1,a)

################# Conditional subset ################ 
abc = mtcars

newdata3 = subset(abc, cyl > 6, 
                  select = c(cyl,hp,drat,wt))

newdata2 = subset(abc, mpg >= 25 & wt < 2,   
                  select=c(mpg,wt,gear,qsec))

newdata4 = subset(abc, mpg >= 25 | wt < 1, # | = or 
                  select=c(mpg,wt,gear,qsec))

newdata2 = subset(abc, hp > 200 ,   
                  select=c(hp,wt))

newdata2 = subset(abc, cyl !=8 ,   
                  select=c(cyl,wt,gear))

abc$cyl = as.factor(abc$cyl)

newdata2 = subset(abc, cyl == "6" ,   
                  select=c(cyl,wt,gear,qsec))

newdata2

rm(newdata2,newdata3,newdata4)
