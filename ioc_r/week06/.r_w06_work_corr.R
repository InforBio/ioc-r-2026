## Week 6 - Homework
## Note: There may be other valid ways to solve this exercise,
## this is just one possible solution!

# For this homework, we will use the [Palmer Penguins dataset](https://allisonhorst.github.io/palmerpenguins/).
# It contains information about three penguin species, living in the Palmer Archipelago.
# For each penguin, measurements include:
# - Bill length and bill depth (in mm)
# - Flipper length (in mm)
# - Body mass (in grams)
# - Sex and the island where it was observed
# - Study year
# The goal is to explore, manipulate and visualize these data in R while practicing the concepts learned in class.

# 0. Set up your workspace.
# Create a new R Project called `penguins_analysis` and save the dataset file [penguins.csv](https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv) inside a folder named `data` in your project.

# 1. Import the `penguins.csv` dataset, name the imported data as `penguins`.
penguins <- readr::read_csv(
  file = "../exos_data/penguins.csv" # replace the path with your own
)


# 2. Insepct the imported data:
# - How many rows and columns are there?
# - Recode the `species`, `island` and `sex` as factors
dim(penguins)

penguins$species <- as.factor(penguins$species)
penguins$island <- as.factor(penguins$island)
penguins$sex <- as.factor(penguins$sex)

# 3. Which species contains the most data?
table(penguins$species)
# Adelie penguins has the most data.

# 4. Extract penguins of "Gentoo" species which live on the "Biscoe" island.
penguins[penguins$species == "Gentoo" & penguins$island == "Biscoe", ]

# 5. Create a new column `bm_kg` which stores the body mass in kilogram.
penguins$bm_kg <- penguins$body_mass_g / 1000

# 6. Which species shows the highest average body mass in kilogram?
mean(penguins[penguins$species == "Adelie", ]$bm_kg, na.rm = TRUE)
mean(penguins[penguins$species == "Gentoo", ]$bm_kg, na.rm = TRUE)
mean(penguins[penguins$species == "Chinstrap", ]$bm_kg, na.rm = TRUE)

# 7. Use scatter plot to visualise the body mass (in kg) and the bill length:
# - Color the point by species.
# - Increase the point size to 2.5.
# - Replace the axis' label by "Body Mass (kg)" and "Bill Length (mm)".
# - Remove the legend title.
# - Use `theme_minimal()`.
# - Put the legend on the top of the figure.
library(ggplot2)

ggplot(
  penguins,
  aes(x = bill_length_mm, y = bm_kg, color = species)
) +
  geom_point(alpha = 0.7, size = 2.5) +
  labs(x = "Bill Length (mm)", y = "Body Mass (kg)", color = NULL) +
  theme_minimal() +
  theme(legend.position = "top")

# What is your observation for Adelie and Chinstrap penguins?
# It seems that both species have similar body mass,
# but the Chinstrap penguins have longer bills.

# 8. Based on your observation from question 7, test if your hypothesis is statistically valid (using significance level at 5%).
# Hints:
# - Check the distribution of body mass or bill length,
# test the normality of data distribution.
# - If it's normally distributed, use a t-test (`?t.test`);
# If it's not normally distributed, use a Wilcoxon rank-sum test.
# - Report the p-value and state your conclusion in one sentence.

# **1/ For the body mass between Adelie and Chinstrap penguins:**
# - H0: there is no difference between two species
# - H1: there is difference between two species

# visual check of distrbution
ggplot(
  penguins[penguins$species != "Gentoo", ],
  aes(bm_kg, fill = species)
) +
  geom_histogram(alpha = 0.5, position = "identity")

# normality test
shapiro.test(penguins[penguins$species == "Adelie", ]$bm_kg)
shapiro.test(penguins[penguins$species == "Chinstrap", ]$bm_kg)

# Since at least one group is not normal -> Wilcoxon rank-sum test
wilcox.test(
  bm_kg ~ species,
  data = penguins[penguins$species != "Gentoo", ]
)

# or you can do:
# wilcox.test(
#   penguins[penguins$species == "Adelie", ]$bm_kg,
#   penguins[penguins$species == "Chinstrap", ]$bm_kg
# )

# The p-value from the Wilcox test is 0.48.
# At the 5% significance level, we failed to reject the null hypothesis.
# Therefore, we do not find evidence of difference in body mass between Adelie and Chinstrap penguins.

# **2/ For the flipper length between Adelie and Chinstrap penguins:**
# - H0: there is no difference between two species
# - H1: there is difference between two species

# visual check of distrbution
ggplot(
  penguins[penguins$species != "Gentoo", ],
  aes(bill_length_mm, fill = species)
) +
  geom_histogram(alpha = 0.5, position = "identity")

# normality test
shapiro.test(penguins[penguins$species == "Adelie", ]$bill_length_mm)
shapiro.test(penguins[penguins$species == "Chinstrap", ]$bill_length_mm)

# Since both groups are normal -> t-test
t.test(
  bill_length_mm ~ species,
  data = penguins[penguins$species != "Gentoo", ]
)

# or you can do:
# t.test(
#   penguins[penguins$species == "Adelie", ]$bill_length_mm,
#   penguins[penguins$species == "Chinstrap", ]$bill_length_mm
# )

# The p-value from the Wilcox test is <2.2e-16.
# At the 5% significance level, we reject the null hypothesis.
# Therefore, we find evidence of difference in flipper length between Adelie and Chinstrap penguins.
