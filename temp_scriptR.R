
#importing data

require(dplyr)
install.packages("weathermetrics")
require(weathermetrics)

temp_df <- read.csv("city_temperature.csv")

summary(temp_df)

attach(temp_df)


#India's data frame

india_df <- temp_df %>% filter(Country == "India")

#India's city averaged temperature over time for the years

india_df <- india_df %>% select(Year,AvgTemperature,City,Month) %>% 
         group_by(Year,City,Month) %>% 
         summarise(Avg_temp = mean(AvgTemperature))

#converting temp from Fahrenite to Celcius
india_df$Avg_temp <- fahrenheit.to.celsius(india_df$Avg_temp,round = 2)


  
#India's major cities averaged temperature for months


