library(dplyr)

filename <- 'femaleMiceWeights.csv'
dat <- read.csv(filename)

controls <- filter(dat, Diet == 'chow')
controls <- select(controls, Bodyweight)
unlist(controls)
controls <- filter(dat, Diet == 'chow') %>% select(Bodyweight) %>% unlist
