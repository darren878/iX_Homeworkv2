library(nycflights13)
library(nycflights13)
library(tinyverse)
install.packages(nycflights13)
install.packages("nycflights13")
install.packages("tidyverse")
library(tinyverse)
library(nycflights13)
install.packages("tinyverse")
install.packages("tinyverse")
flights
library(tidyverse)

#filter flights for only Jan 1st
jan1 <- filter(flights, month == 1, day== 1)

#arrange
#flights with longest departure delay
arrange(flights,desc(dep_delay))
arrange(flights,dep_delay)

#select specific columns
select(flights,year:day)
#all columns from year to day

#use mutate to add a new variable
flight_delay <- arrange(flights,desc(dep_delay)) %>% select (dep_delay)

flight_sml <- select(flights,year:day,ends_with("delay"),distance,air_time)

flight_sml <- flight_sml %>% group_by (month) %>% arrange(desc(dep_delay)

 #introduce the    pipe operator
 
 flights_sml <- flights_sml %>% mutate (gain = dep_delay - arr_delay, speed = distance/air_time = 60)
 flight_sml <- select(flights,year:day,ends_with("delay"),distance,air_time)
 flights_sml <- flights_sml %>% mutate (gain = dep_delay - arr_delay, speed = distance/air_time = 60)

 #average departure delay by day
 by_day <- flights %>% group_by (year,month,day) %>% summarise (delay=mean(dep_delay,na.rm=TRUE)) %>% ungroup()
#summarose: make big data set small  --> always must put summarise behind group_by bcause group_by only to categorise
#ungroup to make sure it doesnt stay grouped when using dataset later
 
 #per group metrics
 popular_dests <- flights %>% group_by(dest) %>% filter(n() >365) %>% ungroup ()

 
 filter(flights, !(arr_delay>120 | dep_delay >120))
 filter(flights, arr_delay <= 120, dep_delay <=120)
 arr_delay120 <- filter(flights, arr_delay >=120)
 
 by_day2 <- group_by (flights, year, month, day)
summarise (by_day2, delay = mean (dep_delay, na.rm=TRUE)) 

delays <- flights %>% group_by(dest) %>% summarise (count=n(), dist= mean(distance, na.rm=TRUE), delay=mean (arr_delay, na.rm=TRUE)) %>% filter(count>20, dest !="HNL")
 