### R script for the hands-on examples
### Week 7

## Install {tidyverse} and Load the Package ---------------------------------------

## Mini Data Project -------------------------------------------------------------
# This mini data project is based on a real project that focuses on gene expression across different time points.
# A researcher has measured the expression levels of 20 genes (anonymed as 1 to 20) using the RT-qPCR technique.
# The gene expression was assessed in two structures of the mouse brain.
# Mice ranged in age from 10 to 60 days (10, 15, 20, 25, 30, 35, 40, 45, 50, 60 days),
# and the experiment was repeated with both male and female mice,
# with 6 animals (named from A to F) in each group.

# According to the researcher, the data was stored in two files, one for each brain structure.
# Within each file, rows represent the different ages,
# and columns represent the gene, sex, and animal.
# For example, column `1MA` represents the expression level of gene 1 from the male mouse A,
# column `15FD` represents the expression level of gene 15 from the female mouse D.

# A small Gaussian noise has been added to the original data, preserving the overall structure.

# The data is available in two CSV files:
# - data_anonym_struc1_noise.csv
# - data_anonym_struc2_noise.csv

# We will focus on the data from the brain structure 1.

### Import the Data ---------------------------------------------------------------

# 1. Please download the `data_anonym_struc1_noise.csv` file.
# Observe your data file:
# - Is there a header line?
# - What is the separator between columns?
# - Which character was used for decimal points?
# - Which character was used for missing data (between two seperators where there's no value)?

# 2. Import the `data_anonym_struc1_noise.csv` into RStudio, you can use either:
# - the `read_csv2()` from the package {`readr`} (`?readr::read_csv2`), or
# - use the click-button way and copy-paste the code in your script.

## Don't forget to use/select the appropriate parameters to make sure you import correctly the data.

# Name the data as `data1`.
# Convert your imported data to tibble format if it's not the case.

# What is the data dimension?

# 3. Show the first 10 columns of your data.

# 4. Rename the first column as `age`.

### Reshape the Data --------------------------------------------------------------

# What can we do with the current data format?
# If we want to calculate the average expression value of a given gene by sex or by age,
# how should the data be organized?

# 5. Reshape the dataset to a longer format using `pivot_longer()`, so that for each mouse:
# - The first column shows the age
# - The second column shows the sample ID (*e.g.*, 1MA, 1MB, ...)
# - The third column shows the gene expression value
# What are the columns to be included to pivot into longer format?

# 6. Add a column `struc` which contains the name of the measured structure `s1`.

# 7. Extract information about gene, sex and animal from the column `id` using the `extract()` function. Name the new columns as "gene_id", "sex" and "animal".

# Hint: Find the patterns for the extraction.
# You can use AI to help you to write the regular expression.

# Now, the data is ready for downstream analysis.

### Manipulate the Data -----------------------------------------------------------

# For question 8 to 11, let's focus on gene 1 from the data.

# 8. At age of 10 days, which animal has the highest expression value for gene 1 overall?

# 9. Is there any missing value for gene 1?
#     If yes, how to remove lines with NA?

# 10. After removing NAs, how many animals are there for each sex in gene 1?

# 11. Summarize the median, mean, and standard deviation of gene 1 expression for both sexes.

### Explore the Data ---------------------------------------------------------------

# What kind of analysis would you like to perform with this data?
# The function `ggpairs()` from the {[`GGally`](https://ggobi.github.io/ggally/index.html)} package
# is useful for creating a matrix of scatter plots to examine the relationships between each pair of variables.
# First, let's install the {`GGally`} package if it is not already installed.

# install.packages("GGally")

# 12. Load the package and take a look at the help page for `ggpairs()`.
# How will you reshape the `data1_long` to provide the necessary data for the `[ggpairs()](https://ggobi.github.io/ggally/articles/ggpairs.html)` function?

# To save space, we will focus on examining the relationship between age and the first 5 genes.
# 13. What did you observe from these scatter plots?

# 14. Calculate the correlation between gene 1 and 2. (`?cor`)

# 15. Draw a scatter plot using {`ggplot2`} to show the expression levels of genes 3 and 5.
#     Color the points by different categorical variables that we have, *i.e.*, age, sex, and animal.
#     Is there any categorical variable that can explain the groups we observed in the figure?
