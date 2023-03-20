library(dplyr)

install.packages("pkgnet")
library(pkgnet)

pkgdb <- tools::CRAN_package_db()

get_deps <- function(pkg){
  DependencyReporter$new()$set_package(pkg)$nodes$node
}
extract_from_cran_db <- function(deps, pkgdb){
  pkgdb %>%
    as_tibble(.name_repair = "universal") %>%
    filter(Package %in% deps)
}


deps%>%
  count(
    License
  )
deps %>%
  summarize(
    any(License_restricts_use, na.rm = TRUE)
  )


presslogdeps <- desc::desc_get_deps(file="PressLogTeamUNL/")
pldeps <- extract_from_cran_db(presslogdeps$package, pkgdb)%>%
  select(Package,Version,Depends,License,License_is_FOSS,License_restricts_use,Description)



library(plyr)

packs <- c('stringi', 'httpuv', 'digest', 'htmltools', 'sourcetools', 'evaluate', 'markdown',
           'stringr', 'yaml', 'rJava', 'testthat')

laply(packs, function(x){
  install.packages(x)
  readline(prompt="Press [enter] to continue")
}
)
remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"), INSTALL_opts = "--no-multiarch", dependencies = c("Depends", "Imports"))
