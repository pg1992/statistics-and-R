library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)

dat <- na.omit(dat)

library(dplyr)
x <- dat %>% filter(Sex=='M') %>% filter(Diet=='chow') %>% select(Bodyweight) %>% unlist
print(mean(x))

library(rafalib)
print(popsd(x))

set.seed(1)
print(mean(sample(x, 25)))
