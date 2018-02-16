library(dplyr)
library(rafalib)
library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)
dat <- na.omit(dat)

x <- dat %>% filter(Sex=='M') %>% filter(Diet=='chow') %>% select(Bodyweight) %>% unlist
x_pop_mean <- mean(x)
print(x_pop_mean)

x_pop_sd <- popsd(x)
print(popsd(x))

set.seed(1)
x_sample_mean <- mean(sample(x, 25))
print(x_sample_mean)

y <- dat %>% filter(Sex=='M') %>% filter(Diet=='hf') %>% select(Bodyweight) %>% unlist
y_pop_mean <- mean(y)
print(y_pop_mean)
y_pop_sd <- popsd(y)
print(y_pop_sd)

set.seed(1)
y_sample_mean <- mean(sample(y, 25))
print(y_sample_mean)

diff <- abs(abs(y_sample_mean - x_sample_mean) - abs(y_pop_mean - x_pop_mean))
print(diff)

x <- dat %>% filter(Sex=='F') %>% filter(Diet=='chow') %>% select(Bodyweight) %>% unlist
x_pop_mean <- mean(x)

x_pop_sd <- popsd(x)

set.seed(1)
x_sample_mean <- mean(sample(x, 25))

y <- dat %>% filter(Sex=='F') %>% filter(Diet=='hf') %>% select(Bodyweight) %>% unlist
y_pop_mean <- mean(y)
y_pop_sd <- popsd(y)

set.seed(1)
y_sample_mean <- mean(sample(y, 25))

diff <- abs(abs(y_sample_mean - x_sample_mean) - abs(y_pop_mean - x_pop_mean))
print(diff)
