library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

set.seed(1)

sample_size <- 5
n <- 1000
avgs1 <- vector('numeric', n)
for(i in 1:n) {
    avgs1[i] <- mean(sample(x, sample_size))
}

sample_size <- 50
n <- 1000
avgs2 <- vector('numeric', n)
for(i in 1:n) {
    avgs2[i] <- mean(sample(x, sample_size))
}

cdf1 <- ecdf(avgs1)
cdf2 <- ecdf(avgs2)

