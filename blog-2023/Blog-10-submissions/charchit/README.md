Web scraping
================
Charch
2023-04-06

The json schema for this blog is different in the announcement than the
schema on the github. Let me know if you want me to change it.

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

My main takeaways from the ethical web scraping is that it takes
resources to build and maintain website and we should respect the
robot.txt file and their terms of services.

Bow and scrape: Basically we should also obtain consent if we are going
to use their content and give them the credit.

It would be nice to provide some value in return if we can. Also, we
should respect the data privacy and try to use only the content which is
necessary for the work or hobby we are doing. Anything else is best to
be not stored on our computer.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

Robot.txt file is use to instruct the web robot how to crawl (find stuff
on) the web. It communicate what parts of the site are accessible and
what actions are allowed. It is usually at the root of a website.

Below is the example from gooogle search central:

” User-agent: Googlebot Disallow: /nogooglebot/

User-agent: \* Allow: /

Sitemap: <https://www.example.com/sitemap.xml> ”

The above file is stopping an agent named “Googlebot” to crawl any URL
that starts with xyz.com/nogooglebot/ but everyone else is allowed.

Robots.txt is usually a guideline and some users do not seem to follow
that online.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

First example is just from the second link of this rmd file as a first
try for this blog.

``` r
library(polite)
```

    ## Warning: package 'polite' was built under R version 4.2.3

``` r
library(rvest)
session <- bow("https://www.cheese.com/by_type", force = TRUE)
result <- scrape(session, query=list(t="semi-soft", per_page=100)) %>%
  html_node("#main-body") %>% 
  html_nodes("h3") %>% 
  html_text()
head(result)
```

    ## [1] "3-Cheese Italian Blend"  "Abbaye de Citeaux"      
    ## [3] "Abbaye du Mont des Cats" "Adelost"                
    ## [5] "ADL Brick Cheese"        "Ailsa Craig"

``` r
library(janitor)
```

    ## Warning: package 'janitor' was built under R version 4.2.3

    ## 
    ## Attaching package: 'janitor'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     chisq.test, fisher.test

``` r
session <- bow("https://en.wikipedia.org/wiki/List_of_national_independence_days", force = TRUE)
ind_html <-
  polite::scrape(session) %>%
  rvest::html_nodes("table.wikitable") %>% 
  rvest::html_table(fill = TRUE)

ind_tab <- 
  ind_html[[1]] %>% 
  clean_names()
ind_tab
```

    ## # A tibble: 202 × 6
    ##    country       name_of_holiday date_of_holiday year_of_event independence_from
    ##    <chr>         <chr>           <chr>           <chr>         <chr>            
    ##  1 Afghanistan   Afghan Indepen… 19 August       1919          United Kingdom   
    ##  2 Albania       Flag Day (Dita… 28 November     1912          Ottoman Empire   
    ##  3 Algeria       Independence D… 5 July          1962          France           
    ##  4 Angola        Independence D… 11 November     1975          Portugal         
    ##  5 Antigua and … Independence D… 1 November      1981          United Kingdom   
    ##  6 Argentina     Independence D… 9 July          1816[8]       Spanish Empire   
    ##  7 Armenia       Republic Day    28 May          1918[9]       Russian Soviet F…
    ##  8 Armenia       Independence D… 21 September    1991          Soviet Union     
    ##  9 Azerbaijan    Independence D… 28 May          1918          Russian Soviet F…
    ## 10 Azerbaijan    Independendenc… 18 October      1991[10]      Soviet Union     
    ## # ℹ 192 more rows
    ## # ℹ 1 more variable: event_commemorated_and_notes <chr>

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
