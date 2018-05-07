install.packages("nycflights13")
require(tidyverse)
require(dplyr)
require(nycflights13)

flights

select(flights, dep_time, arr_delay)

select(flights, "dep_time", "arr_delay")

select(flights, -day, -dep_time)

select(flights, dep_time:arr_delay)

select(flights, 3:9)

select(flights, starts_with("arr"))

select(flights, ends_with("time"))

select(flights, contains("dep"))

select(flights, time_hour, air_time, everything())

select(flights, ano=year)

flights <- select(flights, x1=year, x2=dep_time, x3=arr_time, everything())

flights

select(flights, num_range("x",1:3))

#distinct

distinct(flights, day)