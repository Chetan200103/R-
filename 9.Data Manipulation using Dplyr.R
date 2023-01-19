# Pipe operator
# Use %>% to emphasise a sequence of actions, rather than the object that the actions are being performed on

iris=iris
attach(iris)

library(dplyr)
table(iris$Species)

Good_df = iris %>%
           select(Species)
Good_df

Bad_df =  iris %>% select(Species)
Bad_df

# long pipes
long_df = iris %>%
           group_by(Species) %>%
           summarise(
           M_SPL = mean(Sepal.Length),
           M_SPW = mean(Sepal.Width),
           No_Observartion = n(),
           Species_c = n_distinct(Species))
long_df

# Data Manipulation using DPLyr
library(dplyr)
df = mtcars
View(df)

########## wildcard Subset of data ############ 

# select function - select required column names
names(df)
Select_df = df %>% 
             select(mpg, cyl, disp, hp)
Select_df

# selects column name starts with 'd'
col_start_d = df %>% 
             select(mpg, cyl, disp, hp, drat) %>%
             select(starts_with("d")) 
col_start_d

# selects column name ends with 't'
col_ends_t = df %>% 
              select(mpg, cyl, hp, drat, wt) %>%
              select(ends_with("t") )
col_ends_t

# selects column name contains 'p'
col_contains_p = df %>% 
              select(mpg, cyl, disp, hp, drat) %>%
              select(contains("p"))
col_contains_p

# filter function - with comparison operator
# exactly the same - equal ==
equal = df %>% 
         select(mpg, cyl, disp, hp) %>%
         filter(cyl == 4)
equal

# not equal - !=
not_equal = df %>% 
             select(mpg, cyl, disp, hp) %>%
             filter(cyl != 4)
not_equal

# smaller than - <
smaller_than = df %>% 
                select(mpg, cyl, disp, hp) %>%
                filter(mpg < 21)%>%
                arrange(mpg)
smaller_than
# greater than - >
greater_than = df %>% 
                select(mpg, cyl, disp, hp) %>%
                filter(mpg > 21)%>%
                arrange(mpg)
greater_than

# smaller or equal - <=
smaller_eq = df %>% 
              select(mpg, cyl, disp, hp) %>%
              filter(mpg <= 21)%>%
              arrange(mpg)
smaller_eq

# greater or equal
greater_eq = df %>% 
              select(mpg, cyl, disp, hp) %>%
              filter(mpg >= 21)%>%
              arrange(mpg)
greater_eq

# filter function - with Logical operator
# AND - &;
AND_op = df %>% 
          select(mpg, cyl, disp, hp) %>%  # subset
          filter(mpg > 21 & cyl == 4)  ## multiple condition
AND_op

# OR - |
OR_op = df %>% 
         select(mpg, cyl, disp, hp) %>%
         filter(mpg > 21 | cyl == 4)
OR_op

# NOT - !
NOT_op = df %>% 
          select(mpg, cyl, disp, hp) %>%
          filter(!(mpg > 21 & cyl == 4))
NOT_op

# arrange function ascending
arrange_asc_df  = df %>% 
               select(mpg, cyl, disp, hp) %>%
               filter(mpg > 20)  %>%
               arrange(mpg) # ascending use arrange(desc(mpg))
arrange_asc_df

# arrange function descending
arrange_dsc_df  = df %>% 
                   select(mpg, cyl, disp, hp) %>%
                   filter(mpg > 20)  %>%
                   arrange(desc(mpg)) # ascending use arrange(desc(mpg))
arrange_dsc_df

# mutate function
mutate_df = df %>% 
          select(mpg, cyl, disp, hp) %>%
          filter(mpg > 20)  %>%
          arrange(desc(mpg))  %>%
          mutate(demo = disp + hp) %>%
          mutate(demo_2 = demo/2)
mutate_df

# summerise function using group by function
group_df = df %>% 
            select(mpg, cyl, disp, hp) %>%
            filter(mpg > 20)  %>%
            arrange(mpg)  %>%
            mutate(demo = disp + hp) %>%
            mutate(demo_2 = demo/2) %>%
            group_by(cyl) %>%
            summarise(average=mean(demo),
                      Minimum=min(demo))
group_df

########## Renameing the Columns ########
data  = df %>% 
  select(mpg, cyl, disp, hp) %>%
  rename(Millege_Per_Gallon=mpg)

data

###### Recoding Categorical Variable 
table(df$cyl)
data=df %>%
  select(mpg, cyl, disp, hp) %>%
  mutate(Cyl_bins=recode(cyl,
                           '4' = "4_cylinder",
                           '6' = "6_cylinder",
                           '8' = "8_cylinder")) 
data
str(data)

data2=data %>% 
      mutate(Cyl_bins2=recode(Cyl_bins,
                         "4_cylinder"=1,
                         "6_cylinder"=2,
                         "8_cylinder"=3)) 
data2
str(data2)

long_df=read.csv(file.choose())
# long pipes
df = long_df %>%
  select(LungCap,Age,Height,Smoke)%>%
  group_by(Smoke) %>%
  summarise(Age_1 = mean(Age),
            LungCap_1 = mean(LungCap),
            No_Observartion = n(),
            Species_c = n_distinct(Smoke))
df

