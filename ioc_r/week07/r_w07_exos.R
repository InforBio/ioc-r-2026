### R script for the hands-on examples
### Week 7


## The `apply()` Function ------------------------------------------------------------

## 1. Import the gene expression data file "read-counts.csv" into RStudio
##    and name it as `counts`.



## 2. Calculate following metrics for each row (genes) and
##    column (samples) using the `apply()` function:
##    - Mean (`mean()`)
##    - Variance (`var()`)
##    - Minimum and maximum (`min()`, `max()` or use `range()`)
## What is the expected length or dimension of the outputs?
## Attention: exclude the 1st column for the calculation.


## The `lapply()` Function ------------------------------------------------------------

### Check GC Content ------------------------------------------------------------

## The GC content is the percentage of guanine (G) and cytosine (C) in a DNA or RNA sequence.
## This measure is one of the metrics which can be used in the sequencing quality control
## (e.g., detects contamination).

## Here we will use a small example to see how this metric is calculated.

# Generate a list of DNA sequences
dna_sequences <- list(
  seq1 = "ATGCGTAGCTAGGCTATCCGA",
  seq2 = "CGCGTTAGGCAAGTGTTACG",
  seq3 = "GGTACGATCGATGCGCGTAA",
  seq4 = "TTTAAACCCGGGATATAAAA"
)
dna_sequences[["seq1"]] # the 1st DNA sequence



## 1. Split the 1st DNA sequence into individual bases using the function `strsplit()`. (See `?strsplit`)
seq1 <- strsplit(dna_sequences[["seq1"]], split = "")
seq1

## 2. Convert the results of split to a vector.


## 3. Count the number of G and C bases among all bases.


## 4. Calculate the percentage of GC in the whole sequence.


## 5. Write a function which take one sequence as input to calculate the GC content.
##    Test your function on the 1st sequence of the list.


## 6. Use `lapply()` or `sapply()` to apply the created function to the list of sequences.



### Automate Tasks for a List of Genes ------------------------------------------------------------

## Based on differential gene expression analysis (SET1 *vs.* WT) results,
## draw the boxplot of for the top 3 genes with the smallest adjusted p-value,
## add individual data points on the boxplot and
## show p-value above the boxes with horizontal bar
## (with the help of the ggsignif pacakge).


## 1. Import the differential gene expression analysis (SET1 *vs.* WT) results file "toy_DEanalysis.csv"
##    into RStudio and name it as `de_res`.


## 2. Extract the genes of interest, i.e., 3 genes with the smallest adjusted p-value.


## 3. Based on the `counts` data, build data frame for the *LOH1* gene for the boxplot.
## This data frame should contain:
##   - a column of counts for SET1 and WT samples,
##   - and a column for corresponding the sample group.
## Attention: In order to avoid hardcoding the gene name or sample name,
##            use a variable instead.


## 4. Draw boxplot and show the individual data points on the same figure.


## 5. Add p-value with a horizontal bar on the figure:
##   - install the [`ggsignif`](https://const-ae.github.io/ggsignif/) package,
##   - use the function `geom_signif()` to add a layer to show p-value on the figure.
## Check the documentation of `geom_signif()`, what do we need to add p-value?


## 6. Generalise previous steps with a function which take the name of gene as input.
##    Test the function with another gene.


## 7. Apply the function to the targeted genes.

