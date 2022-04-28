bowie <- read.csv("/Users/Alexey.Zhebel/IdeaProjects/CompLing/RClasses/bowie2.txt")
bowie <- read.csv2("https://raw.githubusercontent.com/Pozdniakov/sirius_advanced/master/data/bowie2.csv")

library(stringi)
library(stringr)
library(glue)
library(udpipe)

month <- data.frame(number = 1:12, name = month.name)

names(month)

c("a", "b")

paste("a", "b", sep="")
paste0("a", "b")
paste(month$number, month$name)
paste(month$number, month$name, sep = "__", collapse = "-----")

typeof(month.name)
typeof(month$name)

sprintf("%s -- is %i month", month$name, month$number)

glue("{month$name} is {month$number} month")

v <- 1:10
glue("{v*v} is {v} squared")

paste(c("Sunny", "Rainy"), month$name)

glue("{rep(c('Sunny', 'Rainy'), 6)} {month$number}")

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")

heroes$info <- glue("Superhero {heroes$name} is {heroes$Alignment}, weight is {heroes$Weight}, height is {heroes$Height}")
heroes$info <- glue("Superhero {heroes$name} is {heroes$Alignment}, {ifelse(heroes$Gender == 'Male', 'his', 'her')} weight is {heroes$Weight}, height is {heroes$Height}")
heroes$info <- glue("Superhero {heroes$name} is {heroes$Alignment}, {dplyr::case_when(heroes$Gender == 'Male' ~ 'his', heroes$Gender == 'Female' ~ 'her', TRUE ~ 'their')} weight is {heroes$Weight}, height is {heroes$Height}")

month$number_name <- paste(month$number, month$name, sep = "_")

split <- strsplit(month$number_name, "_")
str_split(month$number_name, "_")

tidyr::separate(month, number_name, into = c("num", "nam"), sep = "_")

heroes$info[1:5]
names(heroes)

affirmation <- "I will learn R in May"
nchar(affirmation) #number of characters
length(affirmation) #number of objects in a vector (there is just one string)

nstr <- c("hello", "world")
nchar(nstr)
length(nstr)

nchar(month)
nchar(month$name)
length(month$name)

nchar(bowie$lyrics[1])

ll <- nchar(bowie$lyrics)

mean(ll)
max(ll)
min(ll)

mean(nchar(bowie$lyrics), na.rm = TRUE)

substr(affirmation, 1, 9)
substr(month$name, 1, 3)

str_trunc(month$name, 6, ellipsis = "__")

bowie$song_name[1:10]

nchar(bowie$song_name)[1:10] < 10

str_trunc(bowie$song_name[1:10], 10)

str_pad(bowie$song_name[1:10], 10, pad = "_", side = "right")

toupper(str_squish("   Hello   world    "))
tolower(affirmation)

str_to_title(affirmation)

# random

set.seed(42) # перезапустить чтобы снова получать те же значения сначала
rnorm(5)

stri_rand_strings(5, 10, pattern = "[1-5a-c]")

stri_rand_shuffle(affirmation)
stri_rand_shuffle(month$name)

toupper(sort(stri_rand_shuffle(month$name)))

names <- c("John", "Jake", "Andrew", "Liza", "Beck", "Amy")

install.packages("htmlwidgets")

str_view_all(names, "a")
str_detect(names, "a")
which(str_detect(names, "a"))
str_which(names, "a")
str_remove(names, "a")
str_extract(names, "a")
str_extract(names, fixed("a"))
str_replace(names, "a", "z")

# Google: text mining with r (tidy text)

songs <- str_which(bowie$lyrics, "Major Tom")

bowie[songs, all()] %>% View()

song_text <- bowie[bowie$song_name == "Space Oddity", "lyrics"]

df <- udpipe(song_text, object = "english-gum")

df %>%
  filter(upos == "PROPN") %>%
  count(lemma, sort = TRUE)