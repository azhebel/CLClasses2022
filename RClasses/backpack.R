library("tidyverse")
library("Stat2Data")

data("Backpack")
back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

View(back)

cor.test(back$BackpackWeight, back$BackProblems)
t.test(back$BackpackWeight ~ back$BackProblems, paired = FALSE, var.equal = TRUE)

# Linear model
model_back <- lm(backpack_kg ~ body_kg, data = back)

ggplot(data = back) +
  geom_point(aes(x = body_kg, y = backpack_kg)) +
  geom_abline(intercept = model_back$coefficients[1], slope = model_back$coefficients[2]) +
  theme_minimal()

model_back$coefficients

summary(model_back)

total_sum_sq <- sum((back$backpack_kg - mean(back$backpack_kg))^2)
residual_sum_sq <- sum(residuals(model_back)^2)

1 - residual_sum_sq / total_sum_sq # equals to multiple R-squared from summary(model_back)

cor.test(back$backpack_kg, back$body_kg)

plot(model_back)
hist(residuals(model_back))

install.packages("psych")
library("psych")

back %>%
  select(backpack_kg, body_kg, Year, Units) %>%
  corr.test()

set.seed(42)
matrix(rnorm(20 * 100), ncol = 20) %>%
  as.data.frame() %>%
  corr.test()