mtcars

mtcars[] <- lapply(mtcars, as.integer)
mtcars

mtcars <- lapply(mtcars, as.integer)
mtcars

# 
x <- list(a = 1, b = 2)
x[["b"]] <- NULL

str(x)

y <- list(a = 1)
y["b"] <- list(NULL)
str(y)

## look Up tables

x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c(m = "Male", f = "Female", u = NA)
lookup[x]

unname(lookup[x])

### Complicated look up if we have multiple column of a data frame

## matching and merging by hand
grades <- c(1, 2, 2, 3, 1)

info <- data.frame(
  grade = 3:1,
  desc = c("Excellent", "Good", "Poor"),
  fail = c(F, F, T)
)
info

# Using match

id <- match(grades, info$grade)

info[id, ]

## Using rownames

rownames(info) <- info$grade
info[as.character(grades), ]

## Random Sampling/Bootstrapping or integer subsetting

df <- data.frame(x = rep(1:3, each = 2), y = 6:1, z = letters[1:6])
df

# Randomly reorder
df[sample(nrow(df)), ]

# Subsetting 

# Select 3 random rows
df[sample(nrow(df), 3), ] # if replace is FALSE taking more than 6 row is not possible.
                          # Because that changes the original distribution
# Select 6 bootstrap replicates

df[sample(nrow(df), 6, replace = T), ]

# Ordering (integer subsetting)

x <- c("b", "c", "a", "b")

order(x) # Returns the integer in which the vector is orderred

x[order(x)]

# Random;y reorder df

df2 <- df[sample(nrow(df)), 3:1]
df2

df2[order(df2$x), ]
df2[, order(names(df2))]

# Expanding Aggregated counts (integer subsetting)

df <- data.frame(x = c(3, 4, 1), y = c(9, 11, 6), n = c(3, 5, 1))
df

rep(1:nrow(df), df$n)

df[rep(1:nrow(df), df$n), ]

# Removing column from data frames (Character subsetting)

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df

df$z <- NULL
df

# Another way
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df[c("x", "y")]

# When we know the name of any columns

df[setdiff(names(df), "z")] # Prints all the column except "z"

## Selecting rows based on a condition (logical subsetting)
rm(list = ls())
mtcars[mtcars$gear == 5, ] ## subsetts where gear is 5

mtcars[mtcars$gear == 5 & mtcars$cyl == 4, ]

# Another way using subset 

subset(mtcars, gear == 5)

subset(mtcars, gear == 5 & cyl == 4)

# Boolean algebra vs. sets (logical & integer subsetting)

# which allows you to convert a boolean representation to an integer representayion

x <- sample(10) < 3
x # these are boolean 

which(x) # boolean converted to integer

# To make it again logical/boolean
unwhich <- function(x, n) {
  out <- rep_len(FALSE, n)
  out[x] <- TRUE
  out
}
unwhich(which(x), 10)

## Boolean and set operation

x1 <- c(1:10 %% 2 == 0)
x1

x2 <- which(x1)
x2

y1 <- c(1:10 %% 5 == 0)
y1

y2 <- which(y1)
y2

## Now using set operation 

## X & Y <-> intersect(x, y)

x1 & y1 # Only true when both are true
intersect(x2, y2)
## X | Y <-> union(x, y)

x1 | y1

union(x2, y2)

# X & !Y <-> setdiff(x, y)

x1 & !y1

setdiff(x2, y2)

# xor(X, Y) <-> setdiff(union(x, y), intersect(x, y))

xor(x1, y1)

setdiff(union(x2, y2), intersect(x2, y2))

