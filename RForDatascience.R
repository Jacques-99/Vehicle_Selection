rm(list = ls())
library(tidyverse)
data("who")

who1 <- who %>% pivot_longer(cols = new_sp_m014:newrel_f65, 
                             names_to = "key", 
                             values_to = "cases", 
                             values_drop_na = TRUE) 

