## load packages --------------------------------------------------------------
library(dplyr)
library(tidyr)
library(FactoMineR)
library(factoextra)


## data files ------------------------------------------------------------------
input_dir <- "~/Downloads/thomas_torres/data" # replace by the folder where you stored your data
file_names <- c("data_anonym_struc1.csv", "data_anonym_struc2.csv")
outpur_dir <- "~/Downloads/thomas_torres" # replace by the folder where you want to store the output



## test one file --------------------------------------------------------------
if (FALSE) {
file_struc1 <- file.path(input_dir, file_names[1])
data_struc1 <- read.csv(file_struc1, sep = ";", header = TRUE, na.strings = "", dec = ",")
dim(data_struc1)
colnames(data_struc1)

pivot_longer(data_struc1, cols = -c("X"), names_to = "id", values_to = "value") |>
  rename(age = X) |>
  mutate(
    id = sub("X", "", id),
    struc = paste0("s", 1)
  ) |>
  extract(id, into = c("gene_id", "sex", "animal"), regex = "([0-9]+)([MF])([A-F])") |>
  mutate(
    gene_id = paste0("g", gene_id),
    age = paste0("d", age)
  ) |>
  unite("unique_id", -c(value, gene_id), sep = "_", remove = FALSE)
}


## read all data -------------------------------------------------------------------
all_data <- do.call(rbind, lapply(seq_along(file_names), function(i) {
  file_path <- file.path(input_dir, file_names[i])
  data <- read.csv(file_path, sep = ";", header = TRUE, na.strings = "", dec = ",")
  data_long <- pivot_longer(data, cols = -c("X"), names_to = "id", values_to = "value") |>
    rename(age = X) |>
    mutate(
      id = sub("X", "", id),
      struc = paste0("s", i)
    ) |>
    extract(id, into = c("gene_id", "sex", "animal"), regex = "([0-9]+)([MF])([A-F])") |>
    mutate(
      gene_id = paste0("g", gene_id),
      age = paste0("d", age)
    ) |>
    unite("unique_id", -c(value, gene_id), sep = "_", remove = FALSE)
  return(data_long)
}))

if (!file.exists(file.path(outpur_dir, "all_data.csv"))) {
  write.csv(all_data, file.path(outpur_dir, "all_data.csv"), row.names = FALSE)
}



## prepare count matrix and pheno data ----------------------------------------------------------
count_matrix <- all_data |>
  select(gene_id, unique_id, value) |>
  pivot_wider(names_from = unique_id, values_from = value) |>
  column_to_rownames(var = "gene_id") |>
  as.matrix()

# remove columns with all NA
count_matrix <- count_matrix[, colSums(is.na(count_matrix)) < nrow(count_matrix)]
dim(count_matrix)

if (!file.exists(file.path(outpur_dir, "count_matrix.csv"))) {
  write.csv(all_data, file.path(outpur_dir, "count_matrix.csv"), row.names = TRUE)
}


pheno_data <- tibble(unique_id = colnames(count_matrix)) |>
  left_join(
    all_data |>
      select(-c(gene_id, value)) |> unique(),
      by = "unique_id"
    )

if (!file.exists(file.path(outpur_dir, "pheno_data.csv"))) {
  write.csv(all_data, file.path(outpur_dir, "pheno_data.csv"), row.names = TRUE)
}


## run pca -----------------------------------------------------------------------
### PCA for the samples
res_pca <- PCA(t(count_matrix), scale.unit = TRUE, graph = FALSE)
eig_val <- get_eigenvalue(res_pca)

fviz_eig(res_pca, addlabels = TRUE, ylim = c(0, 50))

# show the first factorial plane
fviz_pca_ind(
  res_pca,
  geom.ind = "point", # show points only (nbut not "text")
  col.ind = pheno_data$struc, # color by structure
  addEllipses = TRUE, # Concentration ellipses
  legend.title = "Structure"
)
fviz_pca_ind(
  res_pca,
  geom.ind = "point", # show points only (nbut not "text")
  col.ind = pheno_data$animal, # color by animal
  addEllipses = TRUE, # Concentration ellipses
  legend.title = "Animal"
)
fviz_pca_ind(
  res_pca,
  geom.ind = "point", # show points only (nbut not "text")
  col.ind = pheno_data$sex, # color by sex
  addEllipses = TRUE, # Concentration ellipses
  legend.title = "Sex"
)
fviz_pca_ind(
  res_pca,
  geom.ind = "point", # show points only (nbut not "text")
  col.ind = pheno_data$age, # color by age
  addEllipses = TRUE, # Concentration ellipses
  legend.title = "Age"
)


## data for python -------------------------------------------------------------------
all_data_wider <- do.call(rbind, lapply(seq_along(file_names), function(i) {
  file_path <- file.path(input_dir, file_names[i])
  data <- read.csv(file_path, sep = ";", header = TRUE, na.strings = "", dec = ",")
  data_wide <- pivot_longer(data, cols = -c("X"), names_to = "id", values_to = "value") |>
    rename(age = X) |>
    mutate(
      id = sub("X", "", id),
      struc = paste0("s", i)
    ) |>
    extract(id, into = c("gene_id", "sex", "animal"), regex = "([0-9]+)([MF])([A-F])") |>
    pivot_wider(names_from = gene_id, values_from = value, names_prefix = "gene")
  return(data_wide)
}))

write.csv(
  all_data_wider,
  file.path(outpur_dir, "all_data_python.csv"),
  row.names = FALSE
)
