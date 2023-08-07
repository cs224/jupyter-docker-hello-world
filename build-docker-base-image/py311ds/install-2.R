
# devtools::install_github('r-lib/systemfonts')

list.of.packages <- c("devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

if (!requireNamespace("LexisPlotR", quietly = TRUE)) devtools::install_github("ottlngr/LexisPlotR", force = TRUE)
