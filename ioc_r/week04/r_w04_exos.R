### R script for the hands-on examples
### Week 4

## Import Data -------------------------------------------------------------

# A gene-level differential expression (DE) analysis was performed
# to compare SET1 samples to WT samples using data from `read-counts.csv`.

# The analysis results are available via this link:
# https://raw.githubusercontent.com/InforBio/IOC/refs/heads/main/ioc_r/exos_data/toy_DEanalysis.csv

## - Please donwload the result file and upload it to your data folder.
## - Import the data using the `read.csv()` function.
## (See the documentation with `?read.csv`)
## Name the imported results `de_res`.

de_res



## Exercises -------------------------------------------------------------

## 1. Check the structure of `de_res` using an appropriate R function.
##    What are the dimensions?



# The result contains following columns:

# - `gene_name`: gene name
# - `baseMean`: mean of normalized counts for all samples
# - `log2FoldChange`: log2 fold change
# - `lfcSE`: standard error
# - `stat`: Wald statistic
# - `pvalue`: Wald test p-value
# - `padj`: adjusted p-values (Benjamini-Hochberg procedure)

## 2. Filter the rows where the gene has a log2 fold change (`log2FoldChange`)
##    greater than 0.5.

## 3. Filter the rows where the gene has a log2 fold change smaller than -0.5.

## 4. Filter the rows where the gene has a log2 fold change greater than 0.5 or
##    smaller than -0.5.

## 5. Filter the rows where the gene has a log2 fold change greater than 0.5 and
##    adjusted p-value (`padj`) smaller than 0.05.


## 6. Extract results for these genes: RNR1, PIR3, SRP68.


## 7. Use `ifelse()` to categorize genes.
##    Add a new column, `gene_category`, that assigns categories:
##    - "up" if `log2FoldChange > 0.5`.
##    - "down" if `log2FoldChange < -0.5`.
##    - "neutral" otherwise.


## 8. Use `table()` to count the occurrences of each gene category.


## Bonus Questions  ------------------------------------------------------------

## 9. Write a function to automate "de_res" filtering for genes
##    with a p-value less than or equal to a custom cutoff.



## 10. Based on the function created in question 9, modify the function
##    to allow output ordered by any desired column in `de_res`.
## Hints: You need an extra parameter to specify the wanted
##        column and another parameter to fix the cutoff.


## 11. A yeast gene annotation file was obtained from the Ensembl data base.
##     This file can be donwloaded here:
##     https://raw.githubusercontent.com/InforBio/IOC/refs/heads/main/ioc_r/exos_data/yeast_gene_annot.csv
##     Import the data and add the annotation to the `de_res` data frame using `merge()` function.
