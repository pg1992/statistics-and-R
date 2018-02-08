library(dplyr)
dat <- read.csv('femaleMiceWeights.csv')

control <- dat %>% filter(Diet=='chow') %>% select(Bodyweight) %>% unlist
treatment <- dat %>% filter(Diet=='hf') %>% select(Bodyweight) %>% unlist

population <- read.csv('femaleControlsPopulation.csv') %>% unlist

# first exercise
print(paste('mean of the population: ', mean(population)))

set.seed(1)
print(paste('absolute difference (seed = 1): ', abs(mean(sample(population, 5)) - mean(population))))

set.seed(5)
print(paste('absolute difference (seed = 5): ', abs(mean(sample(population, 5)) - mean(population))))

obs <- mean(treatment) - mean(control)

# null hypothesis is true
n <- 10000
nulls <- vector('numeric', n)
for(i in 1:n) {
    control <- sample(population, 12)
    treatment <- sample(population, 12)
    nulls[i] <-  mean(treatment) - mean(control)
}
print(paste('p-value = ', mean(abs(nulls) > obs)))

# second exercise
x <- population
set.seed(1)
n <- 1000
avgs <- vector('numeric', n)
for(i in 1:n) {
    avgs[i] <- mean(sample(x, 50))
}
print(mean(abs(avgs - mean(x)) > 1))

# Gapminder
library(gapminder)
data(gapminder)
