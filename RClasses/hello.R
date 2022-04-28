# a <- 10
# b <- 1:10
# c <- b * a
#
# print(c)
#
# n <- 1:6
#
# print(n)
#
# k <- c(10, 100)
#
# print(k)
# print(n * k)
# print(n * 100)

# p <- 4:7
# q <- 0:3
#
# p + q
# p - q
# p/q
# p^q
# p*10
# print((1:10)^2)

# (1:20)*c(0,1)
# (1:20)*c(1,0)
#
# rep(2,20)^(1:20)
# rep(10,5)^(0:4)
#
# a <- 1:50
# b <- 2:51
# c = rep(1,50)
#
# sum(c/(a*b))
#
# sum(rep(0.5,21)^(0:20))
# sum(1/2^(0:20))

n <- c(0,1,1,2,3,5,8,13,21,34)
n
n[length(n)] <- 35
n[-5:-7]
n[c(1,5,7)]
n[c(TRUE,FALSE)]
n[c(TRUE,FALSE,FALSE,FALSE,TRUE,FALSE)]

nv <- c(f=1, s=2, t=3)
nv
names(nv)[2] <- "second"
nv[c("second","t")]

mean(n)

n > mean(n)
n[n > mean(n)]

troiki = seq(3,27, by = 3)
troiki[c(2,5,7)]
troiki[length(troiki) - 1]
troiki[-(length(troiki) - 1)]
vec3 <- c(3, 5, 2, 1, 8, 4, 9, 10, 3, 15, 1, 11)
vec3
vec3[c(-2,-5)]
vec3[c(-1,-length(vec3))]
vec3[vec3 < 4 | vec3 > 10]
vec3^2
vec3^(c(2,0.5))

(1:20)[c(FALSE,TRUE)]
(1:20)[(1:20) %% 2 == 0]

a <- c(1, 2, c(1,2,3, c(5,6)))
mean(a == 2)
which(a == 5)

which(a == 1 | a == 2)
which(a %in% c(1,2))

missed <- NA
is.na(missed)
a <- 0/0
a == NaN

n[c(5,8)] <- NA
mean(n)
mean(n[-which(is.na(n))])
mean(n[!is.na(n)])
n[is.na(n)] <- 0

vec4 <- c(300, 15, 8, 20, 0, 1, 110)
vec4

vec4[vec4 > 20] = NA

sum(vec4, na.rm = TRUE)