### R script for the hands-on examples
### Week 9

## Mini Data Project
### Data Import & Exploration ----------------------------------------------

# 1. Import the following datasets using the appropriate functions:
# - Yeast gene annotation data:
#   "https://raw.githubusercontent.com/InforBio/IOC/refs/heads/main/ioc_r/exos_data/mart_export.txt.gz",
#   name the data as `annot`.
# - Gene differential expression analysis (SET1 *vs.* WT):
#   "https://inforbio.github.io/IOC/ioc_r/exos_data/toy_DEanalysis.csv",
#   name the data as `de_res`.
# What are the dimensions of each dataset?


# 2. Which chromosome has the highest number of genes?
# Which chromosome has the lowest number of genes?


# 3. Among mitochondrial genes, find those where the gene description
#  contains "ATP6" or "ATP8".
# Then select and display only the columns: "Gene name" and "Gene description".


# 4. Comparing `de_res` and `annot` genes.
# Do all genes in `de_res` exist in `annot`?
# How many genes in `de_res` lack annotation information?


# 5. Add the annotation information to `de_res`,
#    merge the `annot` data with `de_res` using either:
#     - the `merge()` function (base R), or
#     - the `left_join()` function (from the dplyr package, `?left_join`)


### Data Visualization & Statistical Analysis ------------------------------

# 6. Create a Volcano plot for differential expression results:
# - X-axis: Log2 fold change
# - Y-axis: -log10(p-value)
# - Color: Highlight genes where the description contains "Histone" or "histone".
#   (Hint: Create a new column for this.)
# - Labels some data points: Add gene names for those with
#   an absolute log2 fold change greater than 1.5 (`?geom_text`).
# - Theme: use the `theme_light`.


# So far, we've analyzed gene expression between two groups (SET1 *vs.* WT).
# How can we compare expression levels across four groups
# (WT, SET1, SET1.RRP6, RRP6)? For example,
# how can we test if the average expression level of a gene
# is the same across these four groups?
# Let's take the gene *LOH1* as example.

# 7. Import the expression data using this link:
# "https://inforbio.github.io/IOC/ioc_r/exos_data/read-counts.csv"


# 8. Given the imported counts data,
#    how can we reshape it to extract the necessary information and
#    obtain a tibble with the following columns?
#     - "value": Expression values of the gene *LOH1*
#     - "group": Sample groups (Explore how to use the `str_replace()` function
#                to extract group based on sample name)


# 9. Perform an ANOVA (`aov()`) test and use `summary()` to obtain the results.
# If we take alpha = 0.05, what is your conclusion?

# 10. Conduct a Tukey Honest Significant Differences (TukeyHSD) test to check
#     which groups differ significantly. (`?TukeyHSD`)


# 11. Visualize the expression levels of the *LOH1* gene across the four groups
#     using a boxplot.