### R script for the hands-on examples
### Week 1

## Create an R project ---------------------------------------------------------

# 1. In RStudio, create a new project in your folder.
#    Some rules for naming your project:
#     - Choose a short and descriptive name.
#     - Use snake case (lowercase letters and underscores only).
#       Avoid special characters (such as `!`, `#`, ) and spaces.
#     - The name cannot starts with numbers.
# 2. Open your R project, create three new folders,
#    *i.e.*, `data`, `scripts`, `outputs`.
# 3. Download two files:
#   -  An R script named "r_w01_exos.R" for this week's exercise here:
# https://raw.githubusercontent.com/InforBio/IOC/refs/heads/main/ioc_r/week01/r_w01_exos.R
#     save it into the `scripts` folder.
#   - A data file called "read-counts.csv" here:
# https://raw.githubusercontent.com/InforBio/IOC/refs/heads/main/ioc_r/exos_data/read-counts.csv
#     Put it into the `data` folder.


## Files Description ----------------------------------------------------------------------

### Data File
# We'll be working with a gene expression dataset as an example,
# sourced from this [link](https://monashbioinformaticsplatform.github.io/r-more/).
# The data comes from an experiment using PCR to study 44 genes.
# The results were measured to see which genes are active at different stages in Yeast cell cycling.
# Several strains were tested, including wildtype and some with specific genes knock-downs.
# Samples were taken at nine time points over two cell cycles (two hours).

### The R script
# The `r_w01_exos.R` script contains contains all commands R for the exercise.


## Play with RStudio -----------------------------------------------------------------

# In your R project, open the downloaded R script `r_w01_exos.R`:
# In RStudio menu bar, click *File* -> *Open File* -> selec the Rscript,
# or click the file in the *Files* pane.


### Import Data

# 1. Click on the CSV file in *Files* pane to "View" it. Identify the column separator.
# 2. Import the file into R and call the imported data "counts".
# 3. Copy paste the command shown in the R console.

counts <- read.csv("path/to/read-counts.csv") # replace this line by the copied command


### Exercises

# 1.What is the absolute file path of the count data?
#   What is its absolute path?
#   Verify your answer using the function file.exists().

getwd() # show the current working directory

abs_path <- "" # put your answer between quotes
rel_path <- "" # put your answer between quotes
file.exists(abs_path)
file.exists(rel_path)


# 2. What is the dimension of the data frame?
#   Check the “Environment” panel or use the function dim().
#   In the “Environment” panel,
#   click on the tabular icon next to the dataset to visualize the it.
dim(counts)


## We can extract all gene expressions for the sample named “WT.2” using counts[["WT.2"]].
counts[["WT.2"]]

# 3. Try mode() on the expression data for “WT.2”, what does it return?
mode(counts[["WT.2"]])


# 4.Calculate the average expression (mean()) and
#   standard deviation (sd()) of genes from the sample “WT.2”.

mean(counts[["WT.2"]])
sd(counts[["WT.2"]])


# 5. Generate descriptive statistics for all genes from the sample “WT.2” using summary().
summary(counts[["WT.2"]])


# 6. Generate a histogram for the “WT.2” sample using hist().
#    What does the distribution look like?
hist(counts[["WT.2"]])


# Re draw the histogram with the log2 transformed data,
# what does the distribution look like now?
hist(log2(counts[["WT.2"]]))