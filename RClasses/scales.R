library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", na = c("-", "-99", "NA", " "))

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)

v <- c(2, 6, 5, 3, 15, 50)
mean(v)
median(v)

table(heroes$`Eye color`)

# should count per value???
heroes %>%
  count("Skin color")

fib <- c(0,1,1,2,3,5,8,13,21,34)
mean(fib)
median(fib)

# Mean without 10% of values on each side
mean(fib, trim = 0.1)

# The same as median(fib):
mean(fib, trim = 0.5)

# Variability

range(weight)
min(weight)
max(weight)
diff(range(weight))

mean(abs(weight - mean(weight)))
median(abs(weight - mean(weight)))

# Squared deviation from mean
(weight - mean(weight))^2

# Variance:
mean((weight - mean(weight))^2)

var(weight) # Different!

sum((weight - mean(weight))^2) / (length(weight) - 1) # This is the true variance

# Standart deviation is the square root of variance
sqrt(var(weight))
sd(weight)

# Absolute deviation from median
mad(weight)

# Difference between Q1 and Q3
IQR(weight)

# Skewness: positive/negative skew
install.packages("psych")
psych::skew(weight) # positive skew

# Kurtosis: positive/normal/negative
psych::kurtosi(weight) # positive kurtosis

summary(weight)
summary(heroes)

psych::describe(weight)

heroes %>%
  group_by(Gender) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")
skimr::skim(heroes)

heroes %>%
  group_by(Gender) %>%
  skimr::skim(ends_with("color"))

# plotting

plot(heroes$Weight, heroes$Height)

hist(weight, breaks = 30)

boxplot(Weight ~ Gender, heroes)