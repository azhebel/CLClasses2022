# Normal distribution

dnorm(0, mean = 0, sd = 1)
dnorm(-1)
dnorm(1)
dnorm(-3)
dnorm(3)

vec <- seq(-3, 3, 0.05)
vec
dnorm(vec)
plot(vec, dnorm(vec))

iq <- seq(50, 150, 0.1)
plot(iq, dnorm(iq, mean = 100, sd = 15))

plot(iq, pnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(120, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)

qnorm(0.5, mean = 100, sd = 15)
qnorm(0.9, mean = 100, sd = 15)
qnorm(0.99, mean = 100, sd = 15)

plot(seq(0, 1, .001), qnorm(seq(0, 1, .001), mean = 100, sd = 15))

set.seed(42)
rnorm(10, mean = 100, sd = 15)

samp <- rnorm(100, mean = 100, sd = 15)
hist(samp, breaks = 30)
mean(samp)

sqrt(sum((samp - mean(samp))^2)/length(samp)) #standard deviation
sd(samp) #real sd)

samplemeans <- replicate(10000, mean(rnorm(100, mean = 100, sd = 15))) # выборочное распределение средних из генеральной совокупности
hist(samplemeans, breaks = 30) #compare to samp - much more narrow
mean(samplemeans)
sd(samplemeans) # стандартное отклонение выборочного распределения средних = стандартная ошибка (standard error of the mean) в 10 раз меньше ст откл ген совок

sem <- sd(samp)/sqrt(length(samp))
zcr <- qnorm(0.975)
mean(samp) + sem * zcr
mean(samp) - sem * zcr

hist(rlnorm(100000), breaks = 300)
samplemeans_log <- replicate(100000, mean(rlnorm(100)))
hist(samplemeans_log, breaks = 30)

z <- (mean(samp) - 100)/(15 / sqrt(length(samp)))

plot(seq(-3, 3, 0.01), dnorm(seq(-3, 3, 0.01)))

(1 - pnorm(z)) * 2