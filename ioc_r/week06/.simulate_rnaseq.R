# Simulate RANseq dataset with missing values for week 6 exercises

{
  set.seed(1)
  gp_size <- 30
  data <- data.frame(
    sample_id = paste0("sample", seq(2 * gp_size)),
    expression = c(
      rnbinom(gp_size, size = 10, mu = 50),
      rnbinom(gp_size, size = 10, mu = 80)
    ),
    sample_group = rep(c("Control", "Case"), each = gp_size)
  )
  missing_idx <- sample(1:nrow(data), size = round(0.05 * nrow(data)))
  data$expression[missing_idx] <- NA

  write.csv(
    data,
    file = "ioc_r/exos_data/rna_seq_simulated_data.csv",
    row.names = FALSE
  )
}
