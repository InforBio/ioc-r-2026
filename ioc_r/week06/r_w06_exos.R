### R script for the hands-on examples
### Week 6

## "Fix the Code" Challenge -------------------------------------------------------------------

## 1. Fix the data frame error.
data <- data.frame(
  gene = c("BRCA1", "TP53", "MYC"),
  expression = c(10.5, 8.2, 12.7)
  condition = c("Tumor", "Normal", "Tumor")
)


## 2. Fix error when using the `mean()` function.
counts <- data.frame(
  sample1 = c(1, 2, 3),
  sample2 = c(1, 1, 3),
  sample3 = c(0, 1, 2),
  row.names = paste0("gene", 1:3)
)
mean(counts["gene3", ])


## 3. Fix error in condition.
x <- 10
if (x = 5) {
  print("x is 5")
}


## 4. Fix error in ggplot2.
##    The goal is to show petal length with a boxplot for each species.

ggplot(iris, aes(x = Sepal.Length, y = Species))
geom_boxplot()


## 5. Fix error in ggplot2. The aim is to draw boxplot for each group.

# simulate data for two groups of samples.
set.seed(1)
data <- data.frame(
  gp = rep(1:2, each = 20),
  value = c(rnorm(20), rnorm(20, mean = 5))
)
str(data)
# draw boxplot by group.
ggplot(data, aes(x = gp, y = value)) + 
  geom_boxplot()


## 6. Fix code in data filtration.
# try to keep rows where the value is smaller than -0.5
data[data$value<-0.5, ]



## Mini Data Project -------------------------------------------------------------------------

## A researcher has collected some gene expression data from 12 samples.
## However, some expression values are missing.
## Please help the researcher to clean the data and to performs some basic analyses.

# Simulated dataset with missing values
data <- data.frame(
  sample_id = paste0("sample", 1:12),
  expression = c(
    10.2, 15.2, NA, NA, 9.4, 18.1,
    8.9, 16.0, 10.5, 15.5, 11.5, 13.4
  ),
  sample_group = rep(c("Control", "Case"), times = 6)
)

data

## Tasks:
## 1. Find missing values.
## Which rows contain missing values?
## Hint: Use `is.na()`

## 2. Remove rows with missing values.
## Create a new dataset without missing values.


## 3. Basic summary statistics
##    - What is the mean expression level (after removing missing values)?
##    - What is the max and min expression?


## 4. Find the average expression (`mean()`) and the standard deviation (`sd()`)
##    for each sample group (Control *vs.* Case)


## 5. Use `data_clean` to draw a graph you have already seen,
##    e.g.: box plots, scatter plots, etc.



## 6. To go futhur: Let's visualise the average expression of each group using barplot,
##                  with the help of ChatGPT (or any other AI tool).

## 6a. Prepare data for barplot with error bars.
##    We need to reorganize the data in a dataframe with 2 rows and 3 columns:
##    - the column `group` contain the name of each group
##    - the column `mean` contain the mean expression in  of each group
##    - the column `mean` contain the standard deviations


## 6b. Draw the bar plot:
##    - Plot bars for mean expression (`geom_bar(stat = "identity")`)
##    - Add error bars for standard deviation (`geom_errorbar()`)
##    - Change the aesthetic apsects as you want, *e.g.*: color, title, legend, *etc.*


## 6c. What if we want to add the expression level of each sample to the bar plot?
## Hint: Add another layer for drawing points (`geom_point`),
##       using the data frame that contains the individual data (`data_clean`).
