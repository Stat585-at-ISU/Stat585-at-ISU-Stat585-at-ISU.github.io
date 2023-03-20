library(pkgnet)
library(dplyr)
pkgdb <- tools::CRAN_package_db()
get_deps <- function(pkg){
  DependencyReporter$new()$set_package(pkg)$nodes$node
}

extract_from_cran_db <- function(deps, pkgdb){
  pkgdb %>%
    as_tibble(.name_repair = "universal") %>%
    filter(Package %in% deps)
}

litr_dep <- get_deps("litr")
deps <- extract_from_cran_db(litr_dep, pkgdb)

setdiff(litr_dep, deps$Package)

deps %>%
  count(
    License
  )

press_dep <- get_deps("PressLogTeamUNL")
press_dep

deps <- extract_from_cran_db(press_dep, pkgdb)
deps %>%
  count(
    License
  )
