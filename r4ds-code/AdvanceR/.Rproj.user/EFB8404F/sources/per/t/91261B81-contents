# Quiz
y <- 10
f1 <- function(x) {
  function() {
    x + 10
  }
}
f1(1)()
`+`(1, `*`(2, 3))

mean(, TRUE, x = c(1:10, NA))

mean(c(1:10, NA), na.rm = TRUE)

f2 <- function(a, b) {
  a * 10
}
f2(10, stop("This is an error!"))

# Begins the chapter

library(pryr)

# To see the list of all the functions
objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)
funs

# Lexical scoping

f <- function() {
  x <- 1
  y <- 2
  c(x, y)
}
f()
rm(f) # Removes the function from the environment

# If name is not defined inside the function

x <- 2
g <- function() {
  y <- 1
  c(x, y)
}
g()
rm(x, g)

# Another example
j <- function(x) {
  y <- 2
  function() {
    c(x, y)
  }
}
k <- j(1)
k()
rm(j, k)

# A fresh chart
j <- function() {
  if (!exists("a")) {
    a <- 1
  } else {
    a <- a + 1
  }
  print(a)
}
j()
rm(j)

# Dynamic Lookup

