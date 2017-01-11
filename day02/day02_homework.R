# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
mydata <- read.csv("scottdata/CognitionPaperFinalData.csv")

# 2. Peek at the top few rows
head(mydata)

# 3. Peek at the top few rows for only a few columns
head(mydata[, 1:3])

# 4. How many rows does your data have?
nrow(mydata)

# 5. Get a summary for every column
summary(mydata)

# 6. Get a summary for one column
summary(mydata$Corpus)

# 7. Are any of the columns giving you unexpected values?
Nope

# 8. Select a few key columns, make a vector of the column names
critical.columns <- colnames(mydata)[c(1, 2, 3, 6, 9)]
critical.columns

# 9. Create a new data.frame with just that subset of columns
critical.data <- mydata[, critical.columns]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step
short.data <- critical.data[c(1:10, 625:634), ]
short.data <- critical.data[c(1:10, (nrow(critical.data) - 9):nrow(critical.data)), ]

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
sample(10, 5, replace = FALSE)
sample.data <- critical.data[sample(nrow(critical.data), nrow(critical.data)/2), ]
nrow(sample.data)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

t.test(WithinMinPairs ~ Merged, critical.data)
# need logicals to be able to pull out numbers for different Merged conditions


# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

# 14. Save all results from #12 and #13 in an .RData file

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link
