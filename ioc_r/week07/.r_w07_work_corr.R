## Week 7 - Homework
## Note: There may be other valid ways to solve this exercise,
## this is just one possible solution!

## Mini Data Project (Part 2)

# We already saw how to import and tidy the data for structure 1 during the exercise.
# Just a reminder, the expression of 20 genes was measured in mice aged from 10 to 60 days, with both male and female mice, and each group consists of 6 animals. The gene expression data is stored in two files, one for each brain structure. Within each file, rows represent the different ages, and columns represent the gene, sex, and animal.
# The data is available in two CSV files:
# - [data_anonym_struc1_noise.csv](../exos_data/data_anonym_struc1_noise.csv)
# - [data_anonym_struc2_noise.csv](../exos_data/data_anonym_struc2_noise.csv)

# 1. Import the two data files and reshape them the same way you did up to question 9 of the exercise.
# Then, combine the two datasets into one.
# Make sure to adjust any parameters as needed.

# Hints: You can combine datasets by stacking their rows together to create one final data frame.
# (Use `dplyr::bind_rows()` or `rbind()` for this.)

library(tidyverse)

# create a vector for paths
data1 <- readr::read_csv2(
  file = "../exos_data/data_anonym_struc1_noise.csv",
  locale = locale(decimal_mark = ",")
) |>
  rename(age = ...1) |>
  pivot_longer(cols = -1, names_to = "id", values_to = "value") |>
  mutate(struc = "s1") |>
  extract(
    col = id,
    into = c("gene_id", "sex", "animal"),
    regex = "([0-9]+)([MF])([A-F])"
  )

data2 <- readr::read_csv2(
  file = "../exos_data/data_anonym_struc2_noise.csv",
  locale = locale(decimal_mark = ",")
) |>
  rename(age = ...1) |>
  pivot_longer(cols = -1, names_to = "id", values_to = "value") |>
  mutate(struc = "s2") |>
  extract(
    col = id,
    into = c("gene_id", "sex", "animal"),
    regex = "([0-9]+)([MF])([A-F])"
  )


# bind data frames by rows
all_data <- bind_rows(data1, data2) # or use rbind()
all_data


# 2. Remove lines with NA in expression value.
all_data <- all_data |> drop_na()


# 3. For the mice of 20 days, count how many measurements you have for each brain structure in genes 4 and 5 separately.
all_data |>
  filter(age == 20 & gene_id %in% c("4", "5")) |>
  group_by(struc, gene_id) |>
  count()


# 4. Explore how brain structure and genes 16 to 20 relate to each other using the `pairs()` function.
# Hint: Convert struc to a factor before passing it to `pairs()`.
# Which pair of variables correlated the most?

data_wider <- all_data |>
  filter(gene_id %in% 16:20) |>
  pivot_wider(
    names_from = "gene_id",
    values_from = "value",
    names_prefix = "gene" # to avoid name starts with number
  )

## put histograms on the diagonal
panel.hist <- function(x, ...) {
  usr <- par("usr")
  par(usr = c(usr[1:2], 0, 1.5))
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts
  y <- y / max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
}
## put (absolute) correlations on the upper panels,
## with size proportional to the correlations.
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y, use = "na.or.complete")) # modified to allow NA
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if (missing(cex.cor)) {
    cex.cor <- 0.8 / strwidth(txt)
  }
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
pairs(
  x = select(data_wider, struc, gene16:gene20) |>
    mutate(struc = as.factor(struc)),
  diag.panel = panel.hist,
  lower.panel = panel.smooth,
  upper.panel = panel.cor
)


# 5. Based on the previous figure, which gene appears to show the largest difference in expression between the two brain structures?
# Choose an appropriate figure to display this gene's expression across the brain structures.
ggplot(data = data_wider, aes(x = struc, y = gene19)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(position = position_jitter(width = 0.3, seed = 7), alpha = 0.5) +
  labs(
    x = "Structure",
    y = "Expression Level",
    title = "Expression Level of Gene 19"
  ) +
  theme_light()
