
##Loading The dataset

advertising <- read.csv("C:/Users/user/Desktop/advertising.csv")

##Checking The Data
#a.first columns

head(advertising)

#b. last columns

tail(advertising)

#rows
nrow(advertising)

#summary

summary(advertising)

#Tyding The Dataset
#1.looking for duplicates

duplicated(advertising)

#we found that the data had no duplicates
#changing column name
colnames(advertising)
names(advertising)[names(advertising) == "Male "] <- "Gender"

#looking for null values
any(is.na(advertising))

##EDA
#Univariate Analysis


hist(advertising$Age)

#The average age is 35

plot(density(advertising$Age), main="Age Density Spread")


hist(advertising$Daily.Internet.Usage)

hist(advertising$Daily.Time.Spent.on.Site)

#Most people use 70 to 80 hours a day on a site

pie(table(advertising$Male), main="male vs female")

#1 being male And 0 being female
#females spend more time than males online


pie(table(advertising$Clicked.on.Ad), main="Most likely to click on Ads")

#1 for Yes and 0 for No



#Bivariate Analysis



boxplot(advertising$Daily.Internet.Usage-advertising$Age, notch = TRUE,col=c("grey","gold"), main="Age against internet usage")


library(ggplot2)
ggplot(advertising, aes(x = Area.Income, y = Age)) + geom_point()



sp<-ggplot(advertising, aes(x=Area.Income, y=Daily.Internet.Usage, color=Male)) + geom_point()
sp



ggplot(advertising, aes(x = Daily.Time.Spent.on.Site, y = Daily.Internet.Usage)) + geom_point()

#highlighting numeric columns
mydata <- advertising[, c(1,2,3,4,7,10)]
head(mydata)
#heatmap(mydata)

cormat <- round(cor(mydata),2)
head(cormat)

library(reshape2)
melted_cormat <- melt(cormat)
head(melted_cormat)

library(ggplot2)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()

#high correlation on age & click.on.ads,daily.internet usage&area.income

#Conclusion

#1. Both genders are likely to click on ads equally
#2. Bore female spend more time sites compared to males
#3. Males use internet more compared to ladies
#4. Age bracket of 20 to 30 years are more in area.income

