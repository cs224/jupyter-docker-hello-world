
install.packages(c("cli"))

list.of.packages <- c("devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# if (!requireNamespace("LexisPlotR", quietly = TRUE)) devtools::install_github("ottlngr/LexisPlotR", force = TRUE)

list.of.packages <- c("printr", "bnlearn")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
#BiocManager::install(version = "3.10")
list.of.packages <- c("graph", "RBGL", "Rgraphviz")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
BiocManager::install(new.packages, update = FALSE, ask = FALSE)

list.of.packages <- c("gRbase", "gRain", "rmarkdown")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

list.of.packages <- c("psych", "GPArotation", "corrplot")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# watch out for: https://stackoverflow.com/questions/53813323/installing-r-packages-in-macos-mojave-error-in-if-nzcharshlib-libadd
list.of.packages <- c("Countr") # , "SparseM"
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

list.of.packages <- c("gk") 
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
