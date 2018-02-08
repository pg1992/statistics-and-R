library(dplyr)

dat <- read.csv('msleep_ggplot2.csv')

print(dat %>% filter(order=='Primates') %>% summarise(mean = mean(sleep_total)))
