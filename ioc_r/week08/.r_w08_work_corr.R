## Week 8 - Homework
## Note: There may be other valid ways to solve this exercise,
## this is just one possible solution!

# 1. Import the gene expression count data
# ([read-counts.csv](https://raw.githubusercontent.com/InforBio/ioc-r-2026/refs/heads/main/ioc_r/exos_data/read-counts.csv)).

library(tidyverse)
counts <- read_csv("../exos_data/read-counts.csv")

# 2. Refer to the question 2 of the hands-on examples.
# Write a custom function that reshape the count data for a given gene of interest across any two sample groups.
# The output of this function should be in a format ready to be used for drawing a boxplot.
# Test your function with the gene *PIR3*, for the groups:
# - "WT" and "SET1".
# - "SET1.RRP6" and "RRP6"

reshape_data <- function(raw_df, gene_name, groups) {
  df_boxplot <- filter(raw_df, Feature == the_gene) |>
    pivot_longer(-1) |>
    mutate(group = sub("(.*)\\.([0-9]+)", "\\1", name)) |>
    filter(group %in% groups)
  return(df_boxplot)
}

reshape_data(raw_df = counts, gene_name = "PIR3", groups = c("WT", "SET1"))
reshape_data(
  raw_df = counts,
  gene_name = "PIR3",
  groups = c("SET1.RRP6", "RRP6")
)

# 3. Refer to the question 3 of the hands-on examples,
# based on the function you wrote in the previous question,
# extend it by adding an argument that allows labeling the top N most highly expressed samples in each group.
# Test your function with:
# - the gene *PIR3*
# - the groups "WT" and "SET1"
# - and label the top 2 most highly expressed samples in each group

reshape_data <- function(raw_df, gene_name, groups, top_n) {
  df_boxplot <- filter(raw_df, Feature == the_gene) |>
    pivot_longer(-1) |>
    mutate(group = sub("(.*)\\.([0-9]+)", "\\1", name)) |>
    filter(group %in% groups) |>
    group_by(group) |>
    mutate(label = ifelse(rank(desc(value)) <= top_n, name, NA)) |>
    ungroup()
  return(df_boxplot)
}

reshape_data(
  raw_df = counts,
  gene_name = "PIR3",
  groups = c("WT", "SET1"),
  top_n = 2
)
