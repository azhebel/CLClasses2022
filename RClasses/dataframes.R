install.packages("beepr")
library(beepr)
beep(sound = 4)

install.packages("corrgram")
library(corrgram)
corrgram(mtcars)

install.packages("remotes")
remotes::install_github("Pozdniakov/rdracor")

library(stringi)
library(stringr)
# install.packages("stringi")
library(glue)
library(udpipe)

#create dataframe
month <- data.frame(
  number = 1:12,
  name = month.name
)

#print it out
month

#combine two verctors
c(month$number, month$name)

#combine each element for two vectors
paste("a","b")
paste(month$number, month$name)

#add a column with number + name
month$num_name <- paste(month$number, month$name)
month

