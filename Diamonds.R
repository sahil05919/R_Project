## Which factor most influence the price of diamonds

#Load the inbuilt dataset diamond
#Load the library
library(ggplot2)
library(dplyr)
data("diamonds")
str(diamonds)

#type first 6 
head(diamonds)

#Check missing values
colSums(is.na(diamonds))

##What is the average price of diamonds by cut?

avg_price_cut <- diamonds %>% 
  group_by(cut) %>% 
  summarise(average_price = mean(price, na.rm = TRUE))


## What is average price of daimonds by color?
avg_price_col <- diamonds %>% 
  group_by(color) %>% 
  summarise(average_price = mean(price, na.rm = TRUE))

print(avg_price_cut)
print(avg_price_col)

##What is the distribution of diamond sizes (carat)?
dia_size_dis <- diamonds %>% 
  group_by(carat) %>% 
  summarise(each_size = n())
print(dia_size_dis)

dia_size_dis <- dia_size_dis %>% arrange(desc(each_size))
dia_size_dis


## Visual the realtionship to find out which factor has most important infulence on price
# R/s b/w carat and price

ggplot(diamonds, aes(x = carat, y = price))+
       geom_point(alpha = 0.5, color = "blue")+
       labs(title = "Carat vs price", x = "Carat", y = "Price")+
         theme_minimal()
##As carat size increase price increases as clear from diagram

## price by cut
ggplot(diamonds, aes(x = price, y = cut))+
  geom_boxplot()+
  labs(title = "Price by Cut", x = "Price", y = "Cut")+
  theme_minimal()

##Price by color
ggplot(diamonds, aes(x = color, y = price))+
  geom_boxplot()+
  labs(title = "Price by color", x = "Price", y = "Color")+
  theme_minimal()


##Price by clarity
ggplot(diamonds , aes(x = clarity, y = price))+
  geom_boxplot()+
  labs(title = "Price by clarity", x = "Price", y = "Clarity")+
  theme_minimal()

cor(diamonds %>% select(price, carat, depth, table))

#Carat has positive correlation with price



