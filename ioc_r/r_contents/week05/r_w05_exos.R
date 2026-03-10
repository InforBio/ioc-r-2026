### R script for the hands-on examples
### Week 5

## Install New Packages -------------------------------------------------------------

# We will use a couple of additional R packages for this training
# in sessions 8 and 9, for example:
# - {[tidyr](https://tidyr.tidyverse.org)}: provides functions that help you get to tidy data
# - {[dplyr](https://dplyr.tidyverse.org)}: provides functions that help you to manipulate data

## 1.Install the {`dplyr`} and {`tidyr`} packages.
# install.packages("dplyr") # you only need to install it once
# install.packages("tidyr") # you only need to install it once

## 2. Check if you can find `{dplyr}` and `{tidyr}`
##    in the "Packages" panel in RStudio.

## 3. Please use the following code to create a data frame of
##    all installed packages in your system.
##    Show a couple of first lines of the data frame.
my_pkgs <- as.data.frame(installed.packages()[, c(1, 3:4)])

## 4. According to `my_pkgs`, how many packages are installed in your system?

## 5. Extract the rows for the "ggplot2", "tidyr", "dplyr" packages from `my_pkgs`.

## Create a Basic Histogram -------------------------------------------------------------

# In the hands-on examples of session 1 and 2,
# we have drawn histograms with the basic R function `hist()`.

# Now let's try with functions from {`ggplot2`} package.

## 0. Import the `read-counts.csv` file into RStudio and name the data as `counts`.

## 1. Load the {`ggplot2`} package.
##    Then create a histogram with the function `geom_histogram()`
##      for all genes of the sample "WT.2".
##    Have you noticed the message from `geom_histogram()` about the bins?

## 2.Create a new histogram for the sample "WT.2",
##    but this time use the log2 of the gene counts.
##   Do you see the messages from `geom_histogram()`?

## 3. Try 10 and 20 for the `bins` parameter of `geom_histogram()`.
##    Observe how the histogram changes.

## 4. We will use 10 bins for the histogram.
##    Change the color of the bars to blue.

## 5. Based on the previous figure, fill the bars in orange.

## 6. Based on the previous figure, change:
##    - x-axis title to be: "log2 gene expression"
##    - y-axis title to be: "Counts"
##    - plot title to show sample name and the number of genes used.

## 7. Based on the previous figure, use the theme `theme_bw()`.

## Create a Boxplot with ggplot --------------------------------------------

## In the hands-on examples of session 3,
##  we demonstrated that there is a significant difference in
##  the expression of *LOH1* between WT and SET1 samples.

## This gene is upregulated in SET1 samples compared to WT samples,
##  the log2 fold change is 2.85.

## Now, let's draw a more sophisticated boxplot with ggplot2.

## 0. Prepare a data frame for the boxplot. We need:
##    - a column for the expression levels of different samples
##    - a column to indicate what is the sample group (WT or SET1)

## 1. Create a boxplot for the expression level by sample group.

## 2. Modify labels:
##    - Remove x-axis title
##    - Change y-axis title to "Expression Level"
##    - Add a plot title "Expression of LOH1 in SET1 and WT samples"
##    - Add a subtitle "log2FoldChange = 2.85"

## 3. Add a layer of scatter plot over the boxplot.
##    - Color the points by sample group.
##    - Use the `alpha` parameter to let points be semi-transparent.

## 4. Change the theme to `theme_minimal()`.

## 5. With the `theme()` function:
##    - Move the plot title to the center.
##    - Hide the legend.
