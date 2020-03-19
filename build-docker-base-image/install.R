
#list.of.packages <- c("ggplot2", "Rcpp")
#new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
#if(length(new.packages)) install.packages(new.packages)
# if(!require(somepackage)) install.packages("somepackage")

list.of.packages <- c("cli", "devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#install.packages("cli")
#install.packages("devtools")

if (!requireNamespace("LexisPlotR", quietly = TRUE)) devtools::install_github("ottlngr/LexisPlotR", force = TRUE)

list.of.packages <- c("printr", "bnlearn")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#install.packages("printr")
#install.packages("bnlearn")

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
#BiocManager::install(version = "3.10")
list.of.packages <- c("graph", "RBGL", "Rgraphviz")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
BiocManager::install(new.packages, update = FALSE, ask = FALSE)
#install.packages("graph")
#install.packages("RBGL")

list.of.packages <- c("gRbase", "gRain", "rmarkdown")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#install.packages("gRbase")
#install.packages("gRain")
#install.packages("rmarkdown")


##install.packages("networkD3")
## install.packages("tidyverse")
## install.packages("lubridate")
