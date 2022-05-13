library(tidyverse)

diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)

t.test(diet1$pre.weight, diet1$weight6weeks)

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

# task 22.28

diet2 <- diet %>%
  filter(Diet == 2)

t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

diet3 <- diet %>%
  filter(Diet == 3)

t.test(diet3$pre.weight, diet3$weight6weeks, paired = TRUE)

t.test(diet2$weight6weeks, diet3$weight6weeks)

t.test(diet1$weight6weeks, diet3$weight6weeks)

install.packages("apa")
t_results <- t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

apa::t_apa(t_results, format = "docx")

diet12 <- diet %>%
  filter(Diet %in% c(1,2))

t.test(weight6weeks ~ Diet, diet12, paired = FALSE)

t.test(weight6weeks ~ Diet, diet12, paired = FALSE, var.equal = TRUE)

wilcox.test(weight6weeks ~ Diet, diet12, paired = FALSE)

wilcox.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

install.packages("Stat2Data")
library(Stat2Data)
data("Backpack")

backpack_kg <- Backpack$BackpackWeight
body_kg <- Backpack$BodyWeight

bkg <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

bkg %>%
  select(body_kg, backpack_kg) %>%
  cov()

bkg %>%
  select(body_kg, backpack_kg) %>%
  cor()

cor.test(bkg$backpack_kg, bkg$body_kg)
cor.test(bkg$backpack_kg, bkg$body_kg, method = "spearman")
cor.test(bkg$backpack_kg, bkg$body_kg, method = "kendall")