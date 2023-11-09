#You are required to produce a scatterplot depicting Life Expectancy (y-axis) and
#Fertility Rate (x-axis) statistics by Country.
#The scatterplot needs to also be categorised by Countries’ Regions.
#You have been supplied with data for 2 years: 1960 and 2013 and you are required
#to produce a visualisation for each of these years.
#ome data has been provided in a csv file, some - in R vectors. The csv file contains
#combined data for both years. All data manipulations have to be performed in R (not in excel) 
#because this project may be audited at a later stage
#You have also been requested to provide insights into how the two periods compare.

getwd()
#I loaded in the file
data <- read.csv(file.choose())
view(data)
#filter out the data from the .csv file into two catigories
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]
#created additinal data frames
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

#check summaries
summary(add1960)
summary(add2013)

#merge the pair of data frames
#make sure the names of the data frames match the merge
merged1960 <- merge(data1960, add1960, by.x = "Country.Code", by.y = "Code")
merged2013 <- merge(data2013, add2013, by.x = "Country.Code", by.y = "Code")

#check the new stuctures
str(merged1960)
str(merged2013)

#delet columns
merged1960$Year <- NULL
merged2013$Year <- NULL

#creating the vizz (make sure ggplot2 in installed and loaded)
#1960
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp, color=Region, 
      size=I(3), alpha=I(0.6), main="Life Expectancy vs Fertility (1960)")
#2013
qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp, color=Region, 
      size=I(3), alpha=I(0.6), main="Life Expectancy vs Fertility (2013)")


