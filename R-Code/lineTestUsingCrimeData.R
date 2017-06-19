library(car)
library(stringr)
library(plyr)
library(dplyr)
library(ggplot2)
library(lattice)

CityDeaths <- read.table("../Datasets/Deaths_in_122_U.S._cities_-_1962-2016._122_Cities_Mortality_Reporting_System.csv",sep = ",", header = TRUE, stringsAsFactors = FALSE)
deathsByAge <- select(CityDeaths, Year, State, City, All.Deaths, X.1.year..all.cause.deaths., X1.24.years..all.cause.deaths., X25.44.years, X45.64.years..all.cause.deaths., X65..years..all.cause.deaths.)
stats1984 <- filter(deathsByAge, Year == 1984)

cityDeathModel <- lm(stats1984$State ~ stats1984$All.Deaths + stats1984$City)
cityDeathModel2 <- lm(stats1984$State ~ stats1984$All.Deaths * stats1984$City)
summary(cityDeathModel)
summary(cityDeathModel2)

pdf("../Results/R/CrimeTime.pdf")
ggplot(data = stats1984,mapping= aes(x = State, y = All.Deaths))+
  geom_point()+
  coord_flip()
xyplot(stats1984$X45.64.years..all.cause.deaths. ~ stats1984$All.Deaths | stats1984$State, data = stats1984)
panel = function(x,y,...)
{
  
  panel.xyplot(x,y,...)
  panel.lmline(x,y,...)
}
dev.off()
