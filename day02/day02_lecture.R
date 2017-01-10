# Day 2 lecture

# Review
# - git basics
# - .gitignore issue from yesterday

# Topics:
# - interface: scripts
# - syntax/formatting basics
# - calculator and simple interactive use
# - workspace analogy
# - object basics
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - naming objects
# - reading data from files

# Scripts
# - End with .R
# - written *entirely* in R
# - this is a script!
# - the "comment" symbol is #
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)
# - you can run entire scripts using `source()` function

# Some syntax basics
# - whitespace (mostly) doesn't matter
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out

# calculator
2 + 2
2 * 43
23/5
2^3
5 %% 2

# workspace analogy

###########################
# Objects

# assignment
x <- 9534 * 7389
x

# you can also use `=`
# arrows go both ways

74646 / 445 -> y
y

objects() # display objects in workspace
ls()      # same as objects()

rm("x")   # remove things from the workspace
          # (rarely necessary)
x

rm(list = objects()) # remove everything

objects()

# object naming conventions
# cannot start with a number
# 1b <- 10  # gets an error
b1 <- 10

camelCase <- 10
dot.delimited <- 10
underscore_delimited <- 10

# case matters
x <- 10
X <- 15
x
X

# objects have structure
# simple structure: vectors

y <- c(1, 5, 2, 45, 9, 18) # an object with six parts or "members"
y

z <- 1:20
z

j <- 8:14
j

k <- 14:8
k

m <- c(z, k)
m

my.sequence <- seq(from = 2, to = 200, by = 2)
my.sequence

my.sequence[49]
my.sequence[c(49, 3, 18, 70)]
my.sequence[7:11]

# syntax note: [square brackets] are used ONLY for "extraction"
#              (parentheses) are used in math, and in functions (more below)

3 + 2 * 4
(3 + 2) * 4

# vectors:
# - all a single data type
# - always one-dimensional
# - multi-dimentional things are other types of objects
#   - data frames
#   - lists
#   - matrices
#   - arrays

# data.frame
?sleep
sleep
sleep[2, 1] # sleep is two-dimensional
            # [x, y] is x = rows, y = columns
sleep[2, ]  # leaving one "blank" means "all of them"
sleep[, 1]

# data frames also have "names" for columns, not just numbers

sleep[ , "extra"]
sleep$extra       # equivalent

names(sleep)
str(sleep)
class(sleep)

#############
# Everything in R is an object!
#############

# Some objects function as "tools" -- they *do* stuff
# These are "functions"
# Functions are still objects, too!

objects()  # all functions require (parens)
seq(from = 1, to = 10, by = 3)  # most functions have "arguments"

# functions return a single value, but may have other "side effects"
# the returned value may be complex, but it is still a single *object*

# example: t.test()

# with made-up vectors
vector1 <- c(1:10)
vector2 <- c(3:12)

t.test(x = vector1, y = vector2)
my.results <- t.test(x = vector1, y = vector2)
print(my.results)
str(my.results)
my.results$p.value

###################
# PRACTICE

# using [] and <-, pull out some numbers from the sleep data, and compare with t.test

sleep[1:10, 1]
sleep[11:20, 1]

t.test(x = sleep[1:10, 1], y = sleep[11:20, 1])

group1 <- sleep[1:10, 1]
group2 <- sleep[11:20, 1]
t.test(x = group1, y = group2)

sleep$extra[1:10]
sleep[1:10, ]$extra
sleep[1:10, "extra"]

objects()[1:5]  # brackets pull out values from whatever is to the left

###################

# More on arguments
# - names
# - order
# - optional vs. required

t.test(y = group2, x = group1)
t.test(group1, group2)
t.test(group1)

# getting help()

help(t.test)
?t.test      # equivalent

# finding help
# Google
# "fuzzy matching"

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names

t.test(group1, group2, var.equal = TRUE)
t.test(group1, group2, var.e = TRUE)

# return to t-test
t.test(extra ~ group, data = sleep, paired = TRUE)
t.test(extra ~ group, sleep, paired = TRUE)
t.test(sleep, extra ~ group, paired = TRUE)
t.test(data = sleep, extra ~ group, paired = TRUE)
t.test(data = sleep, extra ~ group, 4:14)

t.test(data = sleep, extra ~ group, paired = FALSE)

search()

summary(sleep)

summary <- function(x) { print("fooled you!") }

rm("summary")
summary(sleep)

###################
# Packages

library(MASS)
install.packages("dplyr")
library(dplyr)
install.packages(c("ggplot2", "tidyr", "lme4"))
library(ggplot2)
library(mice)

update.packages()

##################
# Environments

# workspaces

# naming conflicts

MASS::select(x)
select(x)

# saving workspaces & objects
my.results
save(my.results, file = "t-test_results.RData")

load("t-test_results.RData")
my.results
str(my.results)

##################
# Reading data from files

# read.table() family
?read.table
# for SPSS
# old package: `foreign`
# new package: `haven`

# for Excel: `readxl`
install.packages("readxl")
library(readxl)

# some convenient ways to get initial glances at your data
mydata <- read.csv("scottdata/CognitionPaperFinalData.csv")
head(mydata, 20)
tail(mydata)

nrow(mydata)
ncol(mydata)

summary(mydata)

install.packages("psych")
library(psych)
describe(mydata)
