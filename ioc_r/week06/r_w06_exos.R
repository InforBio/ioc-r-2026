### R script for the hands-on examples
### Week 6

## "Fix the Code" Challenge -------------------------------------------------------------------

## 1. Fix the data frame error.
data <- data.frame(
  gene = c("BRCA1", "TP53", "MYC")
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
##    The goal is to find which value is 3 from the vector.
vec_num <- c(4, 6, 8, 3, 2, 4, 7, 3, 9, 3)
which(vec_num = 3)


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

## Gene expression data were collected from 12 samples of two groups.
## Help the researcher to perform data quality control and
## check if the expression is different between groups.


## Tasks:
## 1. Download the data: https://raw.githubusercontent.com/InforBio/ioc-r-2026/refs/heads/main/ioc_r/exos_data/rna_seq_simulated_data.csv
##    and import it into Rstudio, name it `rnaseq_data`.


## 2. Perform data quality control and describe the data.
## - If missing value exists, which variable(s) and sample(s) are concerned?
## - Do we need to recode variable?

## 3. Remove rows with missing values.
## Create a new dataset without missing values.


## 4. Find the average expression (`mean()`) and the standard deviation (`sd()`)
##    for each sample group (Control *vs.* Case)


## 5. Use `data_clean` to visualize expression between two groups.



## 6. To go futher: Let's visualise the average expression of each group using a barplot,
##                  with the help of ChatGPT (or any other AI tool).

## 6a. Prepare data for barplot with error bars.
##    We need to reorganize the data in a dataframe with 2 rows and 3 columns:
##    - the column `group` contain the name of each group
##    - the column `mean_val` contain the mean expression in  of each group
##    - the column `se_val` contain the standard errors (SE) (SE = SD / sqrt(n))


## 6b. Draw the bar plot:
##    - Plot bars for mean expression (`geom_bar(stat = "identity")`)
##    - Add error bars for standard errors (`geom_errorbar()`)
##    - Change the aesthetic apsects as you want, *e.g.*: color, title, legend, *etc.*


## 6c. What if we want to add the expression level of each sample to the bar plot?
## Hint: Add another layer for drawing points (`geom_point`),
##       using the data frame that contains the individual data (`data_clean`).


## 7. Is the expression different between groups?
## Select a test to compare the expression between groups.
## What is your conclusion?