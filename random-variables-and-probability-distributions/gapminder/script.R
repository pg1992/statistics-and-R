library(dplyr)
library(gapminder)
data(gapminder)

x <- unlist(select(gapminder %>% filter(year == 1952), lifeExp))
hist(x)

# What is the proportion of countries in 1952 that have a life expectancy less
# than or equal to 40?
print(mean(x <= 40))

# What is the proportion of countries in 1952 that have a life expectancy
# between 40 and 60 years? Hint: this is the proportion that have a life
# expectancy less than or equal to 60 years, minus the proportion that have a
# life expectancy less than or equal to 40 years.
print(mean(40 <= x & x <= 60))

# CDF
prop = function(q) {
    mean(x <= q)
}
qs = seq(from=min(x), to=max(x), length=20)
props = sapply(qs, prop)
plot(qs, props)
plot(ecdf(x))
