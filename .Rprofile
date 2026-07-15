source("renv/activate.R")

if (interactive() && Sys.getenv("RSTUDIO") == "") {
  Sys.setenv(TERM_PROGRAM = "vscode")
  tryCatch({
    source(file.path(Sys.getenv("HOME"), ".vscode-R", "init.R"))
    if (exists(".First.sys", envir = globalenv(), inherits = FALSE)) {
      get(".First.sys", envir = globalenv())()
    }
  }, error = function(e) {
    cat("VSCODE-R INIT ERROR:", conditionMessage(e), "\n")
  })
  options(help_type = "html")
}
