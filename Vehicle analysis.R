rm(list = ls())
library(tidyverse)

cars <- read_csv(file = "./PETROL.csv", col_types = c('cccndndn'), col_names = c("make"
                  ,"model", "type", "cylinder","engineSize(L)","tankSize(L)"
                  , "consumption(L/100km)", "range(km)"), skip = 1)

cars <- cars[order(cars$`consumption(L/100km)`, decreasing = FALSE),]

clean <- cars[cars$`consumption(L/100km)` <= 5,c("make",'model','consumption(L/100km)','tankSize(L)')]

