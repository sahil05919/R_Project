#load the libaries
library(ggplot2)
library(dplyr)

#we will study the inbuilt date in r


#Name of Dataset - EuStockMarkets

#The EuStockMarkets dataset is a time series data set included in the base R 
#package datasets. 
#It contains daily closing prices of four major European stock indices from 1991 to 1998. Here's a quick breakdown of the dataset:




#First Six rows in dataset
head(EuStockMarkets)

#Colnames of all datasets
colnames(EuStockDF)

#Dax - Germany
#SMI - Switzerland
#Cac - France
#Ftse - United Kingdom

#Time Period - From 1991 to 1998

#Data Frequency - Daily clsoing prices


#Structure of data
str(EuStockMarkets)


#Analyzing the data
summary(EuStockMarkets)

#plot the time series data
plot(EuStockMarkets)


#timeseries data

#individual dataset plot
#Trend plot
plot(EuStockMarkets[,"DAX"], main = "Dax index trend 1991-1998", ylab = "Dax closing price",xlab = "Time")

#SMI Trend plot

plot(EuStockMarkets[,"SMI"], main = "Smi index trend 1991 to 1998", ylab = "SMI closing price", xlab = "Time")

#correlation matrix
cor(EuStockMarkets)

glimpse(EuStockMarkets)


#anymissing data

any(is.na(EuStockMarkets))

#Returns calculate 
#we need to check if marketing is growing or shrinking
returns <- diff(log(EuStockMarkets))*100
head(returns)

#Stastrical analysis of returns
summary(returns)
apply(returns,2,sd)


#visualization of returns
plot(returns, main = "Daily Return of Eurpoen Stock markets", col = 1:4)


#plotdaily returns
plot(returns)




# EDA
Exploratory Data Analysis
#boxplots

boxplot(returns, main = "Boxplot of daily returns")
#density plots

plot(density(returns[, "DAX"], na.rm = TRUE), main = "Desnity plot of Dax Daily Returns", xlab = "Daily Returns(%)")
#Explanation: A density plot shows where returns are most concentrated. Peaks in the plot indicate the most frequent returns.



