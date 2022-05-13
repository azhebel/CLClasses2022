heroes <- read.csv("heroes_information.csv")

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")

mean(heroes$Height)
mean(heroes$Weight, na.rm = TRUE)

install.packages("naniar")

naniar::replace_with_na(heroes, replace = list(Height = -99)) # not sure how it works

?read.csv()

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv", na.strings = c("-99", "-", "NA", " "))

mean(heroes$Height, na.rm = TRUE)
mean(heroes$Weight, na.rm = TRUE)

# alternatives for reading large datasets
install.packages("data.table")
# library(data.table)
install.packages("readxl")
install.packages("haven")

heroes <- data.table::fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
heroes <- vroom::vroom("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
heroes <- readxl::read_excel("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
heroes <- haven::read("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")

# if/else

n <- 0

if (n > 0) "Positive" else if (n < 0) "Negative" else "Zero"

if (n > 0) {
  "Positive"
} else if (n < 0) {
  "Negative"
} else "Zero"

v <- -2:2

if (v > 0) "Positive" else if (v < 0) "Negative" else "Zero" # not vectorized

ifelse(v > 0, "Positive", "Negative or 0") # vectorized but no "if else"

ifelse(v > 0, "Positive", ifelse(v < 0, "Negative", "Zero")) # better but not optimal for many "if else"

dplyr::case_when(v > 0 ~ "Positive", v < 0 ~ "Negative", v == 0 ~ "Zero") # here is a switch-case

dplyr::case_when(v > 0 ~ "Positive", v < 0 ~ "Negative", TRUE ~ "Zero") # default

# tasks

vec5 <-  c(5, 20, 30, 0, 2, 9)

v <- ifelse(vec5 > 10, "Big", "Small")

heroes$Hair <- ifelse(heroes$Hair.color == "No Hair", "Bold", "Hairy")

heroes$Tall <- dplyr::case_when(heroes$Height > 190 ~ "tall", heroes$Height < 170 ~ "short", TRUE ~ "middle")

# data table (faster and more efficient processing of large datasets)

library(data.table)

heroes_dt <- as.data.table(heroes)
class(heroes_dt)
class(heroes)
summary(heroes)
summary(heroes_dt)

heroes_dt[Publisher == "Marvel Comics", mean(Height, na.rm = TRUE), by = Gender][order(V1)] # not very readable

# tidyverse (more readable syntax)

install.packages("tidyverse")
library(tidyverse)

heroes %>%
  filter(Publisher == "Marvel Comics") %>%
  group_by(Gender) %>%
  summarise(Height = mean(Height, na.rm = TRUE)) %>%
  arrange(Height)

sum(log(abs(sin(1:10))))

1:10 %>% sin() %>% abs() %>% log() %>% sum()

1:10 %>% sin() %>% abs() %>% log(base = 2) %>% sum()

1:10 %>% sin() %>% abs() %>% log(x = 2, base = .) %>% sum()

# tasks

1:10 %>% sum() %>% sqrt()
2 %>% c("sqrt", ., "equals", sqrt(.))

# task 22.27

v <- rep(100, nrow(heroes))
t.test(heroes$Weight, v, paired = TRUE)

t.test(heroes$Height, rep(100, nrow(heroes)), paired = TRUE)

t.test(heroes$Weight, mu = 100)

t.test(heroes$Height, mu = 185)