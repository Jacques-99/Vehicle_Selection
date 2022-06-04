rm(list = ls())
library(tidyverse)

cars <- read_csv(file = "./PETROL.csv", col_types = c("cc"))

length(unique(cars$MAKE))
