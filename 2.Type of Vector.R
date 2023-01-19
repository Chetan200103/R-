
###################Arithmetic operations #########

a = c(1, 3, 5, 7) 
b = c(1, 2, 4, 8)

a+b
a-b
a*b
a/b

######### Logical Operator #######
a>b
a<b
a==b   # = assign , == equal 
a<=b
a>=b

####Vector Index

s = c("aa", "bb", "cc", "dd", "ee") 
s[1]  

s[4]
#Negative Index
#Removing the value at that position
s[-3] 

##Out-of-Range Index
#If an index is out-of-range, a missing value will be reported via the symbol NA.

s[10] 

##Numeric Index Vector
s = c("aa", "bb", "cc", "dd", "ee") 
s[c(2, 3)] 

# Duplicate 
s[c(2, 3, 3)] 

#Out-of-Order Indexes
s[c(2, 1, 3)] 

#Range Index
s[1:3] 


