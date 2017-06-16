library(car)
library(stringr)
library(plyr)
library(dplyr)
library(ggplot2)
library(lattice)

CityDeaths <- read.table("../Datasets/Deaths_in_122_U.S._cities_-_1962-2016._122_Cities_Mortality_Reporting_System.csv",sep = ",", header = TRUE, stringsAsFactors = FALSE)
deathsByAge <- select(CityDeaths, Year, State, City, All.Deaths, X.1.year..all.cause.deaths., X1.24.years..all.cause.deaths., X25.44.years, X45.64.years..all.cause.deaths., X65..years..all.cause.deaths.)

cityDeathModel <- 

pdf("../Results/R/CrimeTime.pdf")
ggplot(data = deathsByAge,mapping= aes(x = City, y = All.Deaths))+
  geom_point()+
  coord_flip()
dev.off()