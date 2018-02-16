library(rafalib)
library(dplyr)
library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

# If a list of numbers has a distribution that is well approximated by the
# normal distribution, what proportion of these numbers are within one standard
# deviation away from the list's average?
prop_1sd <- 2*pnorm(1) - 1

# What proportion of these numbers are within two standard deviations away from
# the list's average?
prop_2sd <- 2*pnorm(2) - 1

# What proportion of these numbers are within three standard deviations away
# from the list's average?
prop_3sd <- 2*pnorm(3) - 1

# Define y to be the weights of males on the control diet. What proportion of
# the mice are within one standard deviation away from the average weight
# (remember to use popsd for the population sd)?
y <- dat %>% filter(Sex=='M') %>% filter(Diet=='chow') %>% select(Bodyweight) %>% unlist
prop_y_1sd <- mean(abs(y - mean(y)) <= popsd(y))

# What proportion of these numbers are within two standard deviations away from
# the list's average?
prop_y_2sd <- mean(abs(y - mean(y)) <= 2*popsd(y))

# What proportion of these numbers are within three standard deviations away
# from the list's average?
prop_y_3sd <- mean(abs(y - mean(y)) <= 3*popsd(y))

# We will now take a sample of size 25 from the population of males on the chow
# diet. The average of this sample is our random variable. We will use the
# replicate to observe 10,000 realizations of this random variable. Set the
# seed at 1, generate these 10,000 averages. Make a histogram and qq-plot of
# these 10,000 numbers against the normal distribution.
#
# We can see that, as predicted by the CLT, the distribution of the random
# variable is very well approximated by the normal distribution.

set.seed(1)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

# What is the average of the distribution of the sample average?
avg_dist <- mean(avgs)

# Answers per se
print(paste('A  1 - Proportion inside 1 sigma:', prop_1sd))
print(paste('A  2 - Proportion inside 2 sigma:', prop_2sd))
print(paste('A  3 - Proportion inside 3 sigma:', prop_3sd))
print(paste('A  4 - Proportion inside 1 sigma of y:', prop_y_1sd))
print(paste('A  5 - Proportion inside 2 sigma of y:', prop_y_2sd))
print(paste('A  6 - Proportion inside 3 sigma of y:', prop_y_3sd))
print(paste('A  9 - Average of the distribution of the sample averages:', avg_dist))
