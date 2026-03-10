## DE analysis with toy data   ----------------------
library(DESeq2)

read_counts <- read.table(
  file = "../exos_data/read-counts.csv",  # replace the path with your own
  header = TRUE, sep = ",", row.names = 1
)
pheno <- data.frame(
  id = colnames(read_counts)[1:20],
  group = factor(rep(c("wt", "set1"), each = 10), levels = c("wt", "set1"))
)

dds <- DESeqDataSetFromMatrix(
  countData = as.matrix(read_counts[, 1:20]),
  colData = pheno,
  design = ~ group
)

dds <- DESeq(dds)
de_res <- results(dds)

write.csv(
  data.table::as.data.table(de_res, keep.rownames = "gene_name"),
  file = "ioc_r/data/toy_DEanalysis.csv", quote = FALSE, row.names = FALSE
)

# save(
#   dds, res,
#   file = "ioc_r/data/toy_DEanalysis.RData"
# )


## annot data from Ensembl   ----------------------
annot <- read.csv("data/yeast_biomart.csv", header = TRUE)
colnames(annot) <- c(
  "ensembl_id", "gene_name", "chromosome", "description", "start", "end"
)
table(de_res$gene_name %in% annot$gene_name)
annot <- annot[annot$gene_name %in% de_res$gene_name, ]
annot <- annot[, c("ensembl_id", "gene_name", "chromosome", "start", "end", "description")]
write.csv(
  x = annot, row.names = FALSE,
  file = "ioc_r/exos_data/yeast_gene_annot.csv"
)
