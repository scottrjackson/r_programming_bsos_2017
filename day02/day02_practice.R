# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - all three pairwise comparisons (i.e., between the three species)
setosa.sep.width <- iris$Sepal.Width[1:50]
versicolor.sep.width <- iris$Sepal.Width[51:100]
virginica.sep.width <- iris$Sepal.Width[101:150]
t.test(setosa.sep.width, versicolor.sep.width)
t.test(setosa.sep.width, virginica.sep.width)
t.test(versicolor.sep.width, virginica.sep.width)

iris.setvers <- iris[1:100, ]
iris.setvirg <- iris[c(1:50, 101:150), ]
iris.versvirg <- iris[c(51:150), ]
setvers.ttest <- t.test(Sepal.Width ~ Species, iris.setvers)
setvirg.ttest <- t.test(Sepal.Width ~ Species, iris.setvirg)
versvirg.ttest <- t.test(Sepal.Width ~ Species, iris.versvirg)

# 2. Find the overall correlation between Sepal.Length and Petal.Length
iris.cor <- cor(iris$Sepal.Length, iris$Petal.Length)
cor.test(iris$Sepal.Length, iris$Petal.Length)

# 3. Get the correlation between Sepal.Length and Petal.Length for each Species
#    separately
iris.set <- iris[1:50, ]
iris.vers <- iris[51:100, ]
iris.virg <- iris[101:150, ]

setosa.cor <- cor(iris.set$Sepal.Length, iris.set$Petal.Length)
versicolor.cor <- cor(iris.vers$Sepal.Length, iris.vers$Petal.Length)
virginica.cor <- cor(iris.virg$Sepal.Length, iris.virg$Petal.Length)

# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.
ToothGrowth # rows 1-30 are "VC", rows 31-60 are "OJ"
t.test(ToothGrowth$len[1:30], ToothGrowth$len[31:60])
vc.len <- ToothGrowth$len[1:30]  # equivalent: ToothGrowth[1:30, "len"]
oj.len <- ToothGrowth$len[31:60]  # equivalent: ToothGrowth[31:60, "len"]
tooth.ttest <- t.test(vc.len, oj.len)

# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch. Re-run it again
#    as a paired t-test.
#    HINT: read the help file carefully!
tooth.ttest.stud <- t.test(vc.len, oj.len, var.equal = TRUE)
tooth.ttest.pair <- t.test(vc.len, oj.len, paired = TRUE)

# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    - use help.search to find a function to do this
??Wilcoxon
tooth.wilcox <- wilcox.test(vc.len, oj.len)

# 7. Save all results (and only those results!) in an
#    .RData object
#    - try to think of (at least) two ways to do this
save(setvers.ttest, setvirg.ttest, versvirg.ttest,
     iris.cor, setosa.cor, versicolor.cor, virginica.cor,
     tooth.ttest, tooth.ttest.stud, tooth.ttest.pair, tooth.wilcox,
     file = "day02/day02_practice_answers.RData")

# 8. Clean, comment, and save this script with your answers

# 9. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
