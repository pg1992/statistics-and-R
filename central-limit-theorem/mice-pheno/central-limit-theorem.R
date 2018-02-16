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
