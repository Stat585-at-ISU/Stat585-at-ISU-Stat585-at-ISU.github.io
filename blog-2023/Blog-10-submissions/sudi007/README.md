[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/r-eeBXSu)
Web scraping etiquette
================
Sudesh Ramesh Bhagat
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

Based on the reading, Ethics in Web Scraping, the first key takeaway for
ethical web scraping is that it is moral to provide a User Agent string
that states the purpose of the web scraping and offers contact
information. The second important takeaway is that web scraping is done
to add value to the data and not duplicate it. The third important key
takeaway is to always credit the original content and do not plagiarize.
For example, it is ethical to include a statement on your website about
how the data was sourced and how it will be utilized.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

ROBOTS.TXT file is also called the Robots Exclusion Standards. It guides
the web-crawling software where it is allowed or not-allowed within the
website. This file is a part of the Robots Exclusion Protocol, created
to monitor and regulate how robots crawl the web. An example is the
ROBOTS.TXT file of the New York Times (Ref:
<https://www.nytimes.com/robots.txt>). This file allows twitterbot
whereas disallows omgilibot, omgili and ia_achiever.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

I have implemented polite package with other packages to scrape the web
site.An example of a website considered for scraping is
<https://en.wikipedia.org/wiki/National_day> its a website which explain
about national day of different nations .A sample code using the polite
package is as follows:

``` r
# national day for each country 
# To clean data
library(tidyverse)
library(lubridate)
library(janitor)
```

    ## Warning: package 'janitor' was built under R version 4.2.3

``` r
# To scrape data
library(rvest)
library(httr)
library(polite)
```

    ## Warning: package 'polite' was built under R version 4.2.3

``` r
url <- "https://en.wikipedia.org/wiki/National_day"
url_bow <- polite::bow(url)
url_bow
```

    ## <polite session> https://en.wikipedia.org/wiki/National_day
    ##     User-agent: polite R package
    ##     robots.txt: 456 rules are defined for 33 bots
    ##    Crawl delay: 5 sec
    ##   The path is scrapable for this user-agent

``` r
ind_html <-
  polite::scrape(url_bow) %>%  # scrape web page
  rvest::html_nodes("table.wikitable") %>% # pull out specific table
  rvest::html_table(fill = TRUE) 
ind_tab <- 
  ind_html[[1]] %>% 
  clean_names()
ind_tab
```

    ## # A tibble: 312 × 3
    ##    nation                         date        significance_of_this_date         
    ##    <chr>                          <chr>       <chr>                             
    ##  1 Acadia (Canada)                15 August   Assumption Day was preferred over…
    ##  2 Afghanistan                    19 August   Independence from United Kingdom …
    ##  3 Albania                        28 November Albanian Flag Day: Raising of the…
    ##  4 Alderney (British Islands)     15 December Homecoming Day, the return of the…
    ##  5 Algeria                        5 July      Independence Day (Algeria) in 1962
    ##  6 American Samoa (United States) 17 April    US Flag Day, commemorates the dat…
    ##  7 Andorra                        8 September Our Lady of Meritxell Day, patron…
    ##  8 Angola                         11 November Independence from Portugal in 1975
    ##  9 Anguilla (United Kingdom)      30 May      Anguilla Day; the beginning of th…
    ## 10 Antigua and Barbuda            1 November  Independence from the United King…
    ## # ℹ 302 more rows

``` r
#reference:https://en.wikipedia.org/wiki/National_day
```

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
