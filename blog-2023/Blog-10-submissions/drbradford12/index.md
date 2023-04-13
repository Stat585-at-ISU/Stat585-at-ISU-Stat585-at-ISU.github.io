Web scraping etiquette …
================
Denise Bradford
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

Denise’s Answers:

> > On my honor, I will try to serve.. and live by the Girls Scout Law
> > :)

- Respect website terms of service: use the `ROBOTS.TXT` file to ensure
  that we know, hat is allowed and what is disallowed.

- Obtain consent: Using the polite package, we can see if there are any
  reasons not to scrape a particular website.

- Minimize impact on the website: We don’t want to upset the flow if
  traffic when we could be using a publicly available API.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

Denise’s Answers:

The `ROBOTS.TXT` file, a.k.a. Robots Exclusion Standard, indicates the
web-crawling software where it is allowed (or not allowed) within the
website.

An instance would be “Blocking a specific web crawler from a specific
web page”:

> > User-agent: Bingbot Disallow: /example-subfolder/blocked-page.html

This syntax tells only Bing’s crawler (user-agent name Bing) to avoid
crawling the specific page at
www.example.com/example-subfolder/blocked-page.html.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

Denise’s Answers:

``` r
library(polite)

# Set the user-agent to identify the scraper
url <- "https://stats.gleague.nba.com/players/traditional/?sort=PTS&dir=-1"
session <- bow(url,
               user_agent = "Denise's R Webscraping Assignment")
session
```

    ## <polite session> https://stats.gleague.nba.com/players/traditional/?sort=PTS&dir=-1
    ##     User-agent: Denise's R Webscraping Assignment
    ##     robots.txt: 0 rules are defined for 1 bots
    ##    Crawl delay: 5 sec
    ##   The path is scrapable for this user-agent

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
