
# https://www.rstudio.com/products/rpackages/devtools/
# https://github.com/hadley/devtools
# https://github.com/ottlngr/LexisPlotR

install.packages("devtools")
# ln -s /bin/tar /bin/gtar
devtools::install_github("hadley/devtools")
devtools::install_github("ottlngr/LexisPlotR", force = TRUE)

library(LexisPlotR)

mylexis <- lexis.grid2(year.start = 2001, year.end = 2018, age.start = 0, age.end = 17, lwd = 0.1)
mylexis <- lexis.age(lg = mylexis, age = 2)
mylexis <- lexis.age(lg = mylexis, age = 2, fill = "red", alpha = 0.8)
mylexis <- lexis.year(lg = mylexis, year = 2009)
mylexis <- lexis.cohort(lg = mylexis, cohort = 2002)
mylexis
lexis.lifeline(lg = mylexis, entry = "2001-07-06", exit = "2010-03-04", lineends = TRUE, colour = "blue", lwd = 0.4, alpha = 1.0)
lexis.lifeline(lg = mylexis, entry = "2008-07-06", exit = "2010-03-04", lineends = TRUE, colour = "skyblue", lwd = 0.5, alpha = 1.0)
