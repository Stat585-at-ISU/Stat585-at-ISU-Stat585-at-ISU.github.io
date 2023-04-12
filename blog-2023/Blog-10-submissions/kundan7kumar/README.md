[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/r-eeBXSu)
Web scraping etiquette …
================
Kundan Kumar
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

**Solution:** The major takeaway for ethical web scraping :

- Before any web-Scarping, it is important to check the website’s terms
  of use and robots.txt file to ensure you are not violating any rules.

- Web-Scarping should not collect sensitive or private information
  without the consent of the website owner or the individuals concerned.
  It should follow data privacy and intellectual property like
  copyrighted material rights.

- Web-scraping should not cause undue load on the website’s server or
  disrupt its performance. It limits the rate at which requests are made
  to the website’s server.

**References:**

- website’s terms of use and robots.txt:
  <https://developers.google.com/search/docs/crawling-indexing/robots/intro>
  and
  <https://techcrunch.com/2022/04/18/web-scraping-legal-court/?guccounter=1>
- Data privacy laws and web scraping:
  <https://www.fieldfisher.com/en/services/privacy-security-and-information/privacy-security-and-information-law-blog/data-scraping-considering-the-privacy-issues>
- Limit request rate:
  <https://blog.cloudflare.com/advanced-rate-limiting/>

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

**Solution:** A robots.txt file is placed on a website’s server,
instructing web crawlers how to crawl and index its pages. It is a plain
text file specifying which parts of the website the web crawlers are
allowed or not to access.

An example of a robots.txt file looks like this:

    User-agent: *
    Disallow: /wp-admin/
    Allow: /wp-admin/admin-ajax.php

**References:** Check for the complete robots.txt:
<https://kinsta.com/robots.txt>

The `User-agent: *` line indicates what rules apply to all web-crawler.
The Disallow lines specify directories or pages not to be accessed by
the bots, while Allow lines allow the bot to access pages or directories
by it.

This `Disallow` help to prevent the bot from crawling a page with
sensitive information.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

**Solution:** We are doing we scrape for Active Civil Service List data,
which consists of all candidate which passed the exam.

<https://data.cityofnewyork.us/City-Government/Civil-Service-List-Active-/vx8i-nprf>

``` r
library(polite)
library(rvest)
library(httr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)

polite_GET <- politely(httr::GET,verbose = TRUE)
res <- polite_GET("https://data.cityofnewyork.us/resource/vx8i-nprf.json")
```

    ## Fetching robots.txt

    ## rt_robotstxt_http_getter: normal http get

    ## 
    ## New copy robots.txt was fetched from https://data.cityofnewyork.us/robots.txt

    ## Total of 1 crawl delay rule(s) defined for this host.

    ## Your rate will be set to 1 request every 5 second(s).

    ## Pausing...

    ## Scraping: https://data.cityofnewyork.us/resource/vx8i-nprf.json

    ## Setting useragent: polite R (4.2.2 aarch64-apple-darwin20 aarch64 darwin20) bot

``` r
#res
df <- jsonlite::fromJSON(rawToChar(res$content))
head(df)
```

    ##   exam_no list_no first_name last_name adj_fa list_title_code
    ## 1    0162 925.000  HIU CHING       LAM  70.00           10001
    ## 2    0162 926.000        XIN      CHEN  70.00           10001
    ## 3    0162 927.000     ARSANY     FARAG  70.00           10001
    ## 4    0162 928.000      SE LA      HONG  70.00           10001
    ## 5    0162 929.000    ANTHONY   SAHADEO  70.00           10001
    ## 6    0162 930.000     BURHAN     AHMED  70.00           10001
    ##             list_title_desc group_no list_agency_code list_agency_desc
    ## 1 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ## 2 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ## 3 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ## 4 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ## 5 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ## 6 ADMINISTRATIVE ACCOUNTANT      000              000 OPEN COMPETITIVE
    ##            published_date        established_date        anniversary_date   mi
    ## 1 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000 <NA>
    ## 2 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000 <NA>
    ## 3 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000 <NA>
    ## 4 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000 <NA>
    ## 5 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000    R
    ## 6 2021-05-26T00:00:00.000 2021-07-28T00:00:00.000 2025-07-28T00:00:00.000 <NA>
    ##   veteran_credit sibling_lgy_credit
    ## 1           <NA>               <NA>
    ## 2           <NA>               <NA>
    ## 3           <NA>               <NA>
    ## 4           <NA>               <NA>
    ## 5           <NA>               <NA>
    ## 6           <NA>               <NA>

Total Candidate passed for different agency

``` r
df_grouped <- df %>%
  group_by(list_agency_desc) %>%
  summarize(total_person = n())

df_grouped
```

    ## # A tibble: 9 × 2
    ##   list_agency_desc                       total_person
    ##   <chr>                                         <int>
    ## 1 ADMINISTRATION FOR CHILDREN'S SERVICES            2
    ## 2 DEPARTMENT OF CITY PLANNING                       1
    ## 3 DEPARTMENT OF EDUCATION                          25
    ## 4 HRA/DEPARTMENT OF SOCIAL SERVICES                 1
    ## 5 NYC EMPLOYEES' RETIREMENT SYSTEM                  5
    ## 6 OFFICE OF THE COMPTROLLER                        19
    ## 7 OPEN COMPETITIVE                                935
    ## 8 POLICE DEPARTMENT                                 9
    ## 9 TEACHERS' RETIREMENT SYSTEM                       3

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
