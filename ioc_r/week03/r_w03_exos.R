### R script for the hands-on examples
### Week 3

## Data Frames -------------------------------------------------------------

# Use the following code to import the file "read-counts.csv" 
# (you have already downloaded it for the hand-on examples of week01).
# Name the imported data `expr_data`.

expr_data <- read.table(
  file = "../exos_data/read-counts.csv",  # replace the path with your own
  header = TRUE, sep = ",", row.names = 1
)

## 1. Check the structure of `expr_data` using an appropriate R function.



## 2. How many unique expression values are in sample WT.2?
##    - Use `unique()` to get the unique values;
##    - then use `length()` to check the number of elements.

## 3. Extract expression levels for the gene "LOH1" in WT samples (WT.1, WT.2, ..., WT.10)
##    and SET1 samples (SET1.1, SET1.2, ..., SET1.10).
##   Store them as `expr_wt` and `expr_set1`.
##   Ensure they are vectors using `unlist()`. (see help with `?unlist`).



## 4. Calculate the fold change and log2 fold change for "LOH1" between WT and SET1 groups.
##    Is the gene up- or down-regulated?



## 5. Use `wilcox.test()` to compare *LOH1* expression between WT and SET1.
##    At alpha = 0.05, what is your conclusion?



## 6. Create a new data frame for *LOH1* gene expression in WT and SET1 samples
##    with two columns:
##        - "expr_value": expression levels
##        - "group": WT or SET1


## 7. With the new data frame, draw a boxplot to compare expression
##    between groups using `boxplot()`. (see `?boxplot`)


## Lists -------------------------------------------------------------

# Here's a toy list storing information about three samples:

my_list <- list(
  # sample information
  sample_info = data.frame(
    id = paste0("sample", 1:3),
    age = c(25, 27, 30),
    sex = c("F", "M", "F")
  ),
  ## expression matrix
  count_expr = matrix(
    1:6, ncol = 2, dimnames = list(
      paste0("sample", 1:3),
      paste0("gene", c("A", "B"))
    )
  ),
  # mesured genes
  gene_name = paste0("gene", c("A", "B")),
  # sequenced family members of each sample
  family_sequenced = list(
    sample1 = c("father", "mother"),
    sample2 = c("father", "mother", "sister"),
    sample3 = c("mother", "sister")
  )
)
my_list

## 1. Use `names()` to extract the names of the elements in the list.


## 2. Extract the `count_expr` matrix from the list.


## 3. From the matrix, find the expression value of geneA in sample2


## 4. Calculate the total counts of each gene across all samples.


## 5. From `sample_info` data frame, extract the `age` column.


## 6. Extract the 1st sequenced family member of sample3.


## 7. Add a new element to the list, "gene_description",
##    with the following values:
##   `c("geneA" = "housekeeping gene", "geneB" = "stress response gene")`
