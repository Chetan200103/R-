abc = mtcars
View(abc)

####################### Base Function = apply ############# 
apply(abc, 1, sum)  # row wise= 1

apply(abc, 2, sum) # Column wise= 2
apply(abc, 2, mean)

### Computing Multiple Function
apply(abc,2,function(x) c(min(x),max(x),mean(x),sd(x)))

########### Creating Own Function ###########

xyz = function(x){
  output  = sum(x)/length(x)  # body 1
  output2 = output*100  # body2
  return(output2)
}

apply(abc,2, xyz)

####################### List Function  ############# 
lapply(abc,mean)
lapply(abc, function(x) unique(x))

####################### sapply function #######################
sapply(abc, mean)

str(abc)
abc1 = data.frame(sapply(abc, as.factor))
str(abc1)


####################### tapply Function  #######################
str(abc$cyl) # str is use to check the structure
levels(as.factor(abc$cyl))
tapply(abc$mpg, abc$cyl, mean)










info = tapply(abc$mpg, abc$am, function(x) c(min(x), median(x), max(x), std.error(x)))
info
