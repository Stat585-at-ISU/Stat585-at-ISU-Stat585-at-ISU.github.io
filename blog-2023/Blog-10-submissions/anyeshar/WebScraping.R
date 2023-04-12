library(rvest)
library(tidyverse)
library(dplyr)

url <- "https://www.goodreads.com/list/show/264.Books_That_Everyone_Should_Read_At_Least_Once"
html <- read_html(url)
html

tables <- html %>% html_table(fill=TRUE)
tables %>% purrr::map(glimpse)


library(polite)

session <- bow(url)
result <- scrape(session, query=list(t="semi-soft"))
