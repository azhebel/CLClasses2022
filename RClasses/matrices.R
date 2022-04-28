v <- 1:10
v

A <- matrix(1:20, nrow = 5)
A
A[2,3]
A[2:4,2:3]
A[,2:3]
A[2:4,2:3] <- 100
A
A == 100

attributes(A)
attr(A, "dim") <- NULL
A

attr(A, "dim") <- c(2, 10)
A

attr(A, "dim") <- c(5, 4)
A

M1 <- matrix(rep(1, 16), nrow = 4)
M1
M1[2:3,2:3] <- 2
M1
M1[,2:3]
M1[2,] == M1[,2]

mult_tab <- matrix(1:9 * rep(1:9, each = 9), nrow = 9)
mult_tab[6:8,3:7]

mult_tab > 9

mult_tab2 <- mult_tab
mult_tab2[mult_tab < 10] <- 0
mult_tab2

simple_list <- list(42, "hi", TRUE)
complex_list <- list(letters[1:10], 42, simple_list)
complex_list

str(complex_list)

named_list <- list(age = 24, phd = TRUE, language = "Rus")
named_list[1]
named_list$age
class(named_list[1])
class(named_list$age)
class(named_list[[1]])

list1 <- list(numbers = 1:5, letters = letters, logic = TRUE)
list1[1]
list1[[1]]
list1$numbers

list1[[1]][1]

list2 <- list(pupa = list1, lupa = list1)
list2

list2[[1]][[2]][3]

df <- data.frame(
  name = c("John", "Bob", "Adam", "Susan", "Kate"),
  age = c(24, 27, 31, 22, 27),
  student = c(TRUE, TRUE, FALSE, TRUE, TRUE)
)

df
str(df)
df[2:3, "age"]

df[df$student, ]
df[df$age > mean(df$age), "name"]

mtcars
str(mtcars)
mtcars[3,4]
mtcars[1:6,1:6]
mtcars[,"wt"]
mtcars[, c("hp", "mpg", "cyl")]
nrow(mtcars[mtcars$cyl == 4,])
nrow(mtcars[mtcars$cyl == 4,])/nrow(mtcars)
sum(mtcars$cyl == 4)/length(mtcars$cyl)
mean(mtcars$cyl == 4)

mtcars[mtcars$hp >= 100 & mtcars$cyl == 4,]

max(mtcars$wt)
min(mtcars$wt)
mtcars[mtcars["wt"] == max(mtcars$wt),]
mtcars[mtcars["wt"] == min(mtcars$wt),]
mtcars[mtcars["wt"] < mean(mtcars$wt),]

mtcars$wt
mtcars["wt_kg"] <- mtcars$wt * 453.59237
str(mtcars)