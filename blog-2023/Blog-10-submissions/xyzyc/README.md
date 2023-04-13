Web scraping etiquette …
================
Yingchao Zhou
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

From [James
Densmore](https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01)
and [polite](https://github.com/dmi3kno/polite):

- Do not become a burden to the website one is scraping from. If there
  is a public API containing the desired data, then scraping does not
  need to happen. After `bow` to the host and get permission first, only
  `nod` is needed in the following process.

- Be open about the scraper’s identity by providing a user agent string
  and respond to the web owner’s contact.

- Respect the PI of the website. Only keep the data necessary to the
  project, and do not pass it as if the scraper owns it. Give credit to
  the website.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

From [JAMI @
EMPIRICAL](https://www.empiricaldata.org/dataladyblog/a-guide-to-ethical-web-scraping):
A ROBOTS.txt file indicates the web-crawling software where it is
allowed (or not allowed) within the website. This is part of the Robots
Exclusion Protocol (REP) which are a group of web standards created as a
way to regulate how robots crawl the web.

I checked the robots.txt file for overleaf.

    # robots.txt for https://www.sharelatex.com/

    User-agent: *
    Disallow: /project/*
    Disallow: /github/repos/*
    Disallow: /recurly.com
    Disallow: /user/password/set
    Allow: /

    User-Agent: AhrefsBot
    Disallow: /

    User-Agent: XoviBot
    Disallow: /

    User-Agent: RankSonicBot
    Disallow: /

    User-Agent: SMTBot
    Disallow: /

It prevents all users (if not logged in I guess) from accessing the
pages of projects, github repos, recurly.com and setting password page.
It also disallows AhrefsBot, XoviBot, RankSonicBot and SMTBot from
visiting the overleaf website.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

I want to scrape the wikipedia for hummingbirds to retrieve the
scientific classification of humming birds.

``` r
library(polite)
library(rvest)
library(purrr)

session <- bow("https://en.wikipedia.org/wiki/Hummingbird", force = TRUE)
result <- scrape(session)

info <- result %>% 
  html_elements(xpath = '//table[@class="infobox biota"]') %>%
  html_table()

info[[1]]
```

    ## # A tibble: 13 × 2
    ##    `HummingbirdTemporal range: Rupelian 30–0 Ma \nPreꞒ\nꞒ\nO\…` `HummingbirdTe…`
    ##    <chr>                                                        <chr>           
    ##  1 ""                                                           ""              
    ##  2 "Four hummingbirdsfrom Trinidad and Tobago"                  "Four hummingbi…
    ##  3 "Scientific classification"                                  "Scientific cla…
    ##  4 "Kingdom:"                                                   "Animalia"      
    ##  5 "Phylum:"                                                    "Chordata"      
    ##  6 "Class:"                                                     "Aves"          
    ##  7 "Clade:"                                                     "Strisores"     
    ##  8 "Order:"                                                     "Apodiformes"   
    ##  9 "Family:"                                                    "TrochilidaeVig…
    ## 10 "Type genus"                                                 "Type genus"    
    ## 11 "TrochilusLinnaeus, 1758"                                    "TrochilusLinna…
    ## 12 "Subfamilies"                                                "Subfamilies"   
    ## 13 "†EurotrochilusFlorisuginaePhaethornithinaePolytminaeLesbii… "†Eurotrochilus…

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
