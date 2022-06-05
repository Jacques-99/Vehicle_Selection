rm(list = ls())
library(tidyverse)

car <- read_csv(file = "./cars_dataset.csv", col_types = c("ccncncnddc"))

t <- ggplot(data = car, aes(x = mpg, y = transmission)) + geom_boxplot()
t + coord_cartesian(xlim = c(0,150))

table(car$Make)
max(table(car$model))
#table(car$model,car$Make)
unique(car[car$Make == "Hyundai", 1])
unique(car[car$Make == "toyota", 1])

#corolla-------------------------------
table(car$model == "Corolla")

corolla <- subset(car, car$model == "Corolla")

g <- ggplot(data = corolla, aes(x = mileage, y = price)) + geom_jitter(aes(color = year))
g + coord_cartesian(xlim = c(0,25000))


#Fiesta-------------------------------
table(car$model == "Fiesta")

fiesta <- subset(car, car$model == "Fiesta")

g <- ggplot(data = fiesta, aes(x = mileage, y = price)) + geom_jitter(aes(color = year))
g + coord_cartesian(xlim = c(0,125000))
g + geom_smooth(method = "gam")

h <- ggplot(data = fiesta, aes(x = year, y = mileage)) + geom_jitter(aes(color = price))
h + xlim("2014","2016","2018","2020") + scale_color_gradient(low = "white", high = 'navy')


t <- ggplot(data = fiesta, aes(x = year, y = price)) + geom_jitter(aes(color = mileage))
t + xlim("2014","2015","2016","2017","2018","2019") + ylim(2500,22500) + scale_color_gradient2(low = "lightblue", mid = "purple", high = 'navy', midpoint = 60000) + geom_hline(aes(yintercept = 8000)) + geom_hline(aes(yintercept = 10000)) + theme_light() + labs(title = "Second hand Ford Fiesta prices:") + xlab("Ford Fiesta Model") + ylab("Price ($)")
t + scale_color_gradient2(low = "lightblue", mid = "royalblue", high = 'navy', midpoint = 60000) + theme_light() + labs(title = "Second hand Ford Fiesta prices:") + xlab("Ford Fiesta Model") + ylab("Price ($)") + guides(x = guide_axis(angle = 45))
#RColorBrewer::display.brewer.all()
