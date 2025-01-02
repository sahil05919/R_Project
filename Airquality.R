#Air Quality Data ( Inbuild in R)
# Load the dataset
data("airquality")

#check the dataset
head(airquality)

#str of dataset
str(airquality)


#Check for missing value
colSums(is.na(airquality))

#ozone has 37 empty and solar.r has 7 empty values.

table(is.na(airquality$Ozone), airquality$Month)
table(is.na(airquality$Solar.R), airquality$Month)

#Ozone has mostly missing value in june. 21

#we are using interpolation as a logical choice

#install iib
install.packages("zoo")
library(zoo)

airquality$Ozone <- na.approx(airquality$Ozone)
colSums(is.na(airquality))

##Same for Solar.r
airquality$Solar.R<- na.approx(airquality$Solar.R)



##Summarize & understand the data
summary(airquality)

##checking correlation
cor(airquality[,c("Ozone", "Solar.R", "Wind", "Temp")], use = "complete.obs")

##Result ( plotting important variable)

#A Ozone vs temp
plot(airquality$Temp, airquality$Ozone,
     main = "Ozone vs Temp",
     xlab = "Temp(F)", ylab = "Ozone(ppb)",
     col = "Blue", pch = 19)
#aDD A TREND LINE
abline(lm(Ozone ~ Temp, data = airquality), col = "red")

#B Ozone vs Wind
plot(airquality$Ozone , airquality$Wind,
     main = "Ozone VS Wind",
     xlab = "Wind", ylab = "Ozone", 
     col = "Green", pch = 19)
abline(lm(Ozone ~ Wind, data = airquality), col = "red")


#c Solar cv Ozone
plot(airquality$Ozone, airquality$Solar.R,
     main = "Ozone vs Solar Radiation",
     xlab = "Solar", ylab = "Ozone",
     col = "Brown", pch = 19)
abline(lm(Ozone ~ Solar.R, data = airquality), col = "red")


#Multiple regression model
ozone_model <- lm(Ozone ~ Temp + Wind + Solar.R,data = airquality)
summary(ozone_model)


plot(airquality$Ozone, predict(ozone_model),
     main = "Predicted vs Actual Ozone Levels",
     xlab = "Actual Ozone", ylab = "Predicted Ozone",
     col = "blue", pch = 19)
abline(0, 1, col = "red")  # Add a perfect fit line

plot(ozone_model)

