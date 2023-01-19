################### joins / Merge  ########################

df1 = data.frame(customerid = c(1:6),
                 product = c("mobile","mobile","mobile",
                             "Radio","Radio","Radio"))

df2 = data.frame(customerid = c(2,4,6,8), 
                 City = c("Delhi","Delhi","Mumbai","Mumbai"))

names(df1)
names(df2)

############ inner join or merge ##################
merge(df1, df2, by= "customerid")

###########  outer join #######################:
merge(x = df1, y = df2, by = "customerid", all = TRUE)

############ Left join #########################
merge(x = df1, y = df2, by = "customerid", all.x = TRUE)

############ Right join##########################
merge(x = df1, y = df2, by = "customerid", all.y = TRUE)

################### Append ######################

city = c("mumbai", "delhi", "pune", "bangalore")

state = c("MH", "DL", "MH", "AP")

zipcode = c(33602, 98104, 061061, 80294)

addresses = data.frame(city,state,zipcode)
View(addresses)

####### New_addreses dataframe #######

city = c("Navi_mumbai", "Hyderabad")
state = c("MH", "AP")
zipcode = c(80230, 33498)

new_addresses = data.frame(city, state, zipcode)
View(new_addresses)

################# rbind : append row #################
#rbind : combines or append data from both the dataframe
# same columns : primary need

all_addresses = rbind(addresses, new_addresses)
View(all_addresses)