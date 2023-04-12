[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/r-eeBXSu)
Web scraping etiquette
================
ycb
2023-04-06

## Prompt:

With great power comes great responsibility - a large part of the web is
based on data and services that scrape those data. Now that we start to
apply scraping mechanisms, we need to think about how to apply those
skills without becoming a burden to the internet society.

Find sources on ethical web scraping - some readings that might help you
get started with that are:

- [James
  Densmore](https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01)

- R package [polite](https://github.com/dmi3kno/polite)

- [JAMI @
  EMPIRICAL](https://www.empiricaldata.org/dataladyblog/a-guide-to-ethical-web-scraping)

After reading through some of the ethics essays write a blog post
addressing the following questions:

1.  **What are your main three takeaways for ethical web scraping? -
    Give examples, or cite your sources.**

- Do the scraping off-peak hours and request the data at a reasonable
  rate.

- Let the website’s administrator know who you are, your intentions as
  well as your contact information by adding some strings in the
  user-agent.

- Read ROBOTS.TXT and respect their rules.

References:

- <https://www.empiricaldata.org/dataladyblog/a-guide-to-ethical-web-scraping>

- <https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01>

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

A ROBOTS.TXT file indicates what is allowed and what is not allowed in
the web crawling. It is part of the Robot Exclusion Protocol (REP).

In the robots.txt for <https://www.costco.com>, part of the file is as
follows:

User-agent: \*

Disallow: /\*?\*pageSize=\*

Allow: /\*?currentPage=\*pageSize=\*

which means costco.com does not want any use-agent to crawl the url
/\*?\*pageSize=\*, but it is allowed to crawl the url
/\*?currentPage=\*pageSize=\*.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

``` r
library(polite)
library(rvest)
library(readr)
library(dplyr)
session <- bow("https://www.nytimes.com/elections/2016/results/iowa", force = TRUE)
tbl <- scrape(session) %>% html_table(fill=TRUE) 
ia_results <- tbl[[2]] %>% mutate(
  Trump  = parse_number(Trump),
  Clinton = parse_number(Clinton)
)
head(ia_results)
```

    ## # A tibble: 6 × 3
    ##   `Vote by county` Trump Clinton
    ##   <chr>            <dbl>   <dbl>
    ## 1 Polk             93492  119804
    ## 2 Linn             48390   58935
    ## 3 Scott            39149   40440
    ## 4 Johnson          21044   50200
    ## 5 Black Hawk       27476   32233
    ## 6 Story            19458   25709
