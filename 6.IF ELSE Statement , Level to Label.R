################# create 2 hp Level ####################
abc = mtcars

str(abc)

abc$hpcat = as.factor(ifelse(abc$hp > 200,"sport_car",
                             "Normal_Car"))
str(abc)

############# to check the level in a variable #############
table(abc$hpcat)

abc$hpcat = factor(abc$hpcat,
                   levels = c("Normal_Car","sport_car"),
                   labels = c(1,2))
table(abc$hpcat)

rm(abc)

############## More than 2 levels #############
abc = mtcars

abc$hpcat = as.factor(ifelse(abc$hp<= 70,"Normal_Car",
                              ifelse(abc$hp<=200,"Semi_sport","sport_car")))

############## level to label #############
table(abc$hpcat)
abc$hpcat = factor(abc$hpcat,
                   levels = c("Normal_Car","Semi_sport","sport_car"),
                   labels = c(1,2,3))

table(abc$hpcat)

rm(abc)
