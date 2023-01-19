######### Contigency table #############
automobile = read.csv("C:/Users/User/Desktop/Python Code/ITM Notes/R-CODES/Auto.csv")

################# one variable contigency table ##############
table(automobile$Type)

table(automobile$Origin)

################# one variable Proportional contigency table ##############

prop.table(table(automobile$Type))*100

prop.table(table(automobile$Origin))*100


################# Two variable contigency table ##############

table(automobile$Type, automobile$Origin)

###############  How to get marginals form contingency table ###########
tab1 = table(automobile$Type,automobile$Origin)
tab1


########### Over all wise marginal contingency table #############

prop.table(table(automobile$Type, automobile$Origin))*100

########### Row wise marginal contingency table #############

prop.table(table(automobile$Type, automobile$Origin),margin = 1)*100

############# Columns wise marginal contingency table #############

prop.table(table(automobile$Type, automobile$Origin),margin = 2)*100



a<-chisq.test(automobile$Type, automobile$Origin)

### function throws the above warning 
### whenever one of the expected counts is lower than 5 

a$expected

######### Fisher's exact test #######
### Fisher's exact test is an alternative to chi-squared test used mainly 
##### when a chi-squared approximation is not satisfactory

b<-fisher.test(automobile$Type, automobile$Origin)
b

