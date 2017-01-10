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

objects() # display objects in workspace
ls()      # same as objects()

rm("x")   # remove things from the workspace
          # (rarely necessary)
x

rm(list = objects()) # remove everything

objects()

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

# data.frame
?sleep
sleep
sleep[2, 1] # sleep is two-dimensional
            # [x, y] is x = rows, y = columns
sleep[2, ]  # leaving one "blank" means "all of them"
sleep[, 1]

# data frames also have "names" for columns, not just numbers

sleep[, "extra"]
sleep$extra       # equivalent

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


###################
# PRACTICE

# using [] and <-, pull out some numbers from the sleep data, and compare with t.test

###################

# More on arguments
# - names
# - order
# - optional vs. required

# getting help()

help(t.test)
?t.test      # equivalent

# sometimes hints from tab-completion in RStudio

# return to t-test

###################
# Packages



##################
# Environments

# workspaces

# naming conflicts

# saving workspaces & objects


##################
# Reading data from files

# read.table() family

# some convenient ways to get initial glances at your data

