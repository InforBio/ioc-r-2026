### R script for the hands-on examples
### Week 8

## Import Data ----------------------------------------------------------

# We will reuse the gene-level differential expression (DE) results
# ([`toy_DEanalysis.csv`](https://raw.githubusercontent.com/InforBio/ioc-r-2026/refs/heads/main/ioc_r/exos_data/toy_DEanalysis.csv)) introduced in session 4.
# These results were obtained by comparing **SET1** samples against **WT** samples using the corresponding count data
# ([read-counts.csv](https://raw.githubusercontent.com/InforBio/ioc-r-2026/refs/heads/main/ioc_r/exos_data/read-counts.csv)).

# - Import the DE results and save them as `de_res`.
# - Import the count data and save it as `counts`.

## Visualisation ----------------------------------------------------------

# 1. Set `theme_minimal()` as the default theme,
# and define a custom color palette for WT ("#336872") and SET1 ("#EF7B30").

# 2. Identify the most significantly up-regulated gene (*i.e.* the one with the lowest adjusted p-value).
# Create a boxplot of its expression counts across WT and SET1 samples, using:
# - `geom_boxplot()` and `geom_points()`
# - the custom group colors defined above
# Store the resulting figure in an object named `p`.

# 3. Add labels to the top 3 most highly expressed samples in each group in the previous boxplot,
# using `geom_label_repel()` from the {ggrepel} package.
# Hints:
# - Use `group_by()` to allow downstream operations performed "by group".
# - Use `rank()` to rank expression values. (`?rank`)
# Save the final plot as `p_label`.

# 4. Based on the previous figure, add the adjusted p-value using `stat_pvalue_manual()`
# from the {ggpubr} package. (`?stat_pvalue_manual`)
# Save the final plot as `p_signif`.

# 5. Create a horizontal bar plot showing the log2 fold change for each gene,
# and highlight those with an adjusted p-value (`padj`) below 0.05.
# Hints:
# - Add a column ranking genes by their log2 fold change.
# - Add a column indicating whether the gene meets the significance threshold.
# Save the final plot as `p_lfc`.

# 6. Write a custom function that generates a boxplot (like `p` in Question 2 ) for any gene of interest.
# Test your function with the gene *FAR1*.
# Save the resulting plot as `p2`.

# 7. Combine `p_lfc`, `p_signif`, and `p2` into a single layout using {patchwork}.
# Place `p_lfc` on the left, and arrange the two boxplots on the right (one on top of the other)
# using the `|` or `/` operators.

## Bonus Question ----------------------------------------------------------

# 8. Explore the `wrap_plots()` function from {`patchwork`}. Try to:
# - Recreate the same figure arrangement as in the previous question, this time using the "design" argument.
# - Add panel labels ("A", "B", "C") to the plots with the `plot_annotation()` function.
