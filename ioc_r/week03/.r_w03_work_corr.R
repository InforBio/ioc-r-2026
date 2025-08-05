## Week 3 - Homework
## Note: There may be other valid ways to solve this exercise,
## this is just one possible solution!

# 1. Create a matrix of two columns to store numbers 1 to 8,
# use the `dimnames` parameter of the `matrix` function to name
# the rows and columns directly. (see `?matrix`)
# (You can name the rows/columns whatever you want.)

matrix(
  1:8,
  ncol = 2,
  dimnames = list(
    # provide a list to name the matrix
    paste0("r", 1:4),
    paste0("c", 1:2)
  )
)


# Use the following code to import the file "read-counts.csv"
# (you have already downloaded it for the hand-on examples of week01).
# Name the imported data `expr_data`.

expr_data <- read.table(
  file = "../exos_data/read-counts.csv", # replace the path with your own
  header = TRUE,
  sep = ",",
  row.names = 1
)

# 2. Create a list `info_expr` to store information about `expr_data`:
#   - "col_names": column names
#   - "row_names": row names
#   - "dimension": number of rows and columns
#   - "sum_sample": the sum of expression level across all genes for each sample
#   - "avg_gene": the average expression level across all samples for each gene

info_expr <- list(
  "col_names" = colnames(expr_data),
  "row_names" = rownames(expr_data),
  "dimension" = dim(expr_data),
  "sum_sample" = colSums(expr_data),
  "avg_gene" = rowMeans(expr_data)
)
info_expr

# 3. Calculate the median of the average gene expression levels across all samples.

median(info_expr[["avg_gene"]])

# 4. Use `summary()` to generate summary statistics of the sum of expression level across all genes.

summary(info_expr[["sum_sample"]])

# 5. Calculate the log2 fold change of the gene *TOS6* for the WT and RRP6 samples.
# Is *TOS6* up or down-regulated in the RRP6 samples compared to WT?

## extract the TOS6 expression for each group
expr_wt <- unlist(expr_data["TOS6", paste0("WT.", 1:10)])
expr_wt
expr_rrp6 <- unlist(expr_data["TOS6", paste0("RRP6.", 1:10)])
expr_rrp6

## calculate the log2FC
log2fc <- log2(mean(expr_rrp6) / mean(expr_wt))
log2fc

# The log2FC is `r log2fc`, which is smaller than 0,
# so the *TOS6* gene is down-regulated in RRP6 samples compared to WT group.

# 6. Perform a Wilcoxon test to check if the *TOS6* expression is different between
# WT and RRP6 samples.
# - Store the test results in a variable (object) called `res_wilcox`.
#   What is the data structure of the results? Extract the p-value from the results.
# - Use $\alpha = 0.05$, what is your conclusion?

## perform wilcoxon test
res_wilcox <- wilcox.test(expr_wt, expr_rrp6)

## check results structure
str(res_wilcox)

## verify the names of elements in the list
names(res_wilcox)

## extract the p-value
res_wilcox[["p.value"]]

# The p-value is greater than 0.05, so we fail to reject the null hypothesis.
# The distribution between groups is not significantly different.

# 7. Visualize the expression level of *TOS6* for WT and RRP6 samples using boxplot.

## built a data frame for the boxplot
expr_tos6 <- data.frame(
  expr_value = c(expr_wt, expr_rrp6),
  group = rep(c("WT", "RRP6"), each = length(expr_wt))
)
## draw the boxplot
boxplot(expr_value ~ group, data = expr_tos6)

# The distribution of two groups are indeed similar,
# but the maximum value in the WT group is much higher than that of RRP6 group.
