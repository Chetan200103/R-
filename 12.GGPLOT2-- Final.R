
###### Import Data
new=read.csv("C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/Auto.csv")

attach(new)

######### Histrogram #############
library(ggplot2)

hist(new$Price)

a = ggplot(data = new, mapping = aes(x = Price))
a


b = a+geom_histogram(fill="green",color="black",binwidth = 5)+xlab("Price")+ylab("Frequency")+ggtitle("frequency vs Price")
b

rm(b)       

############# Scatter Plot #############

plot(new$MPG.city,new$Horsepower)

a = ggplot(new,aes(x = MPG.city,y =Horsepower))+geom_point()
a

aa=a+geom_point(color="blue")+xlab("Mileage")+ylab("HP")+ggtitle("HP Vs MPG")
aa

rm(aa,a)

######### Bubble Chart ########

b = ggplot(new,aes(x = MPG.city,y = Horsepower))
b

b = b+geom_point(aes(color=AirBags,size=factor(Origin)))+xlab("Mileage")+ylab("HP")+ggtitle("HP Vs MPG")
b

rm(b)

############ Bar chart ###################
b = ggplot(new, aes(x = AirBags))

b = b+geom_bar(fill="pink",color="black")+ggtitle("Simple Bar chart")
b
rm(b)

############ stacked Bar chart ###################

b = ggplot(new,aes(x = AirBags))

b = b+geom_bar(aes(fill=Origin),position = "stack")+ggtitle("Stack Bar chart")
b

rm(b)

############ group Bar chart ###################

b = ggplot(new,aes(x = AirBags))

b=b+geom_bar(aes(fill=Origin),position = "dodge")+ggtitle("Group Bar chart")
b

rm(b)

############ Boxplot ###################
boxplot(new$Price)

b = ggplot(new,aes(y = Price))+geom_boxplot()
b


b = ggplot(new,aes(x = AirBags,y = Price))+geom_boxplot()
b

rm(b)


b = ggplot(new, aes(x = AirBags,y = Price))+geom_boxplot(color="black",fill="lightblue")
b

rm(b)

b = ggplot(new,aes(x = AirBags,y = Price))+geom_boxplot(aes(fill=AirBags))
b

rm(b)

############# Line Charts ###############
df = data.frame(dose=c("D0", "D1", "D2"),
                 len=c(4.2, 10, 29.5))
View(df)

# Basic line plot with points
##### group =1 means connect with lines of data points
ggplot(df, aes(x=dose, y=len, group=1)) +
  geom_line()+
  geom_point()


# Change the line type
ggplot(df, aes(x=dose, y=len, group=1)) +
  geom_line(linetype = "dashed")+
  geom_point()


# Change the color
ggplot(df, aes(x=dose, y=len, group=1)) +
  geom_line(color="red",linetype="dashed")+
  geom_point()

# Change the color
ggplot(df, aes(x=dose, y=len, group=1)) +
  geom_line(color="red",linetype="dashed" , size =.5)+
  geom_point(color="blue",size =2)

df2 = data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0", "D1", "D2"),2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
View(df2)


# Line plot with multiple groups
ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line()+
  geom_point()

# Change line types
ggplot(data=df2, aes(x=dose, y=len, group=supp)) +
  geom_line(linetype="dashed", color="blue", size=0.5)+
  geom_point(color="red", size=2)

# Change line types and point shapes
ggplot(df2, aes(x=dose, y=len, group=supp)) +
  geom_line(aes(linetype=supp,color=supp), size=0.5)+
  geom_point(aes(shape=supp ,color=supp),size=2.0)
