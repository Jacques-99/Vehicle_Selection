rm(list = ls())
library(tidyverse)

cars <- read_csv(file = "./PETROL.csv", col_types = c('cccndndn'), col_names = c("make"
                  ,"model", "type", "cylinder","engineSize","tankSize"
                  , "consumption", "range"), skip = 1)

cars <- cars[order(cars$consumption, decreasing = FALSE),]

df <- cars[cars$consumption <= 5,c("make",'model','consumption','tankSize')]

unique(df$make)

barplot(height = df$consumption[1:10], names.arg = df$model[1:10], horiz = TRUE, las = 1)

g <- ggplot(data = cars, aes(x = consumption, y = cylinder)) + geom_point(aes(col = engineSize))
g + coord_cartesian(xlim = c(0,10), ylim = c(2,6))

h <- ggplot(data = cars, aes(y = make, x = consumption))
h + geom_boxplot(aes(fill = "red"))

i <- ggplot(data = cars, aes(cylinder, engineSize)) 
i + geom_raster(aes(fill = consumption), hjust = 0.5, vjust = 0.5, interpolate = FALSE)
i + geom_tile(aes(fill = consumption))
