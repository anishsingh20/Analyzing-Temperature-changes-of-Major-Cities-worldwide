
#importing data

require(dplyr)
install.packages("weathermetrics")
require(weathermetrics)

temp_df <- read.csv("city_temperature.csv")

$Avg_temp <- fahrenheit.to.celsius(india_df$Avg_temp,round = 2)

summary(temp_df)

attach(temp_df)


#India's data frame

india_df <- temp_df %>% filter(Country == "India")

#India's city averaged temperature over time for the years

india_df <- india_df %>% select(Year,AvgTemperature,City,Month,Day) %>% 
         group_by(Year,City,Month,Day) %>% 
         summarise(Avg_temp = mean(AvgTemperature))

#converting temp from Fahrenite to Celcius
india_df$Avg_temp <- fahrenheit.to.celsius(india_df$Avg_temp,round = 2)


  
#India's major cities averaged annual temperature for years

india_annual <- india_df %>% 
  group_by(Year,City) %>% 
  summarise(Avg_temp = mean(Avg_temp))
  
  
Bombay_df <- india_annual %>% 
  filter(City=="Bombay (Mumbai)")

Delhi_df <- india_annual %>% 
  filter(City=="Delhi")


Chennai_df <- india_annual %>% 
  filter(City=="Chennai (Madras)")


Kolkata_df <- india_annual %>% 
  filter(City=="Calcutta")


#finding the hottest days for each month in each year for Indian cities:

hottest_bombay <- temp_df %>% 
  filter(City=="Bombay (Mumbai)") %>% 
  group_by(Month,Year) %>% 
  summarise(Max_temp = max(AvgTemperature))

hottest_bombay$Max_temp <- fahrenheit.to.celsius(hottest_bombay$Max_temp,round = 2)


hottest_delhi <- india_df %>% 
  filter(City=="Delhi") %>% 
  group_by(Month,Year) %>% 
summarise(Max_temp = max(AvgTemperature))

hottest_delhi$Max_temp <- fahrenheit.to.celsius(hottest_delhi$Max_temp,round = 2)
