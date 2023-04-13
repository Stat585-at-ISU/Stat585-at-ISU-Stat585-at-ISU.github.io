Web Scraping
================
Harun Celik
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

- Both readings discussed the importance of using an API first. I had
  thought of this from the side of the scraper but rarely from the side
  of the page owner and found it useful to be thinking about as I go on
  developing tools. I’m convinced that with any online platform that I
  would like to host should have a more serious contemplation about the
  development of APIs for public or quasi-public access.

- The topic of identification was also interesting since I’ve mostly
  used APIs that used keys instead of direct pulls off the web. While
  I’ve asked for personal permission and cited the material I took from
  a web-scraping portion of a project, I don’t recall adding my name and
  information for the person to keep record of in the future. I’ll
  certainly be more mindful of it now.

- My third takeaway, which is less direct, relates to the approach of
  the authors in these articles. They say the word ‘ethics’ but what
  they really describe are scraping etiquette. I think deeper engagement
  with the ethics of scraping is necessary so that guiding principles
  can uniformly be set in place. While I found the blogs to be useful, I
  am still left with questions about the moral systems behind scraping
  and how these values could shape the future of scraping practice and
  legality.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

- The purpose of a ROBOTS.TXT file is to help guide incoming web traffic
  by directing search engine crawlers to access particular portions of
  your webpage. An example that I can think of might be that if you run
  a page which has a news feed but also a section where users are
  directed to a log-in portal, you would want the log-in portal to be
  protected from unnecessary traffic to lessen any security risks.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

- I had ambitions to build a systematic scraping method for users with
  access to the [Historical Statistics of the United States Online
  Edition](https://hsus.cambridge.org/HSUSWeb/HSUSEntryServlet) but
  didn’t do nearly as well as I thought I would. Instead, I’ll
  demonstrate a polite scrape with a different objective. I would like
  to know all the popular packages that Dr. Hofmann is working on! I
  want to perform a scrape that gives me just their names.

``` r
library(rvest)
library(polite)
```

``` r
session <-bow("https://github.com/heike", user_agent = "Student from STAT 585 course at ISU")
result <- scrape(session) %>%
  html_elements(".repo") %>% 
  html_text
```

``` r
# These are Dr. Hofmann's current popular packages:
cat(result)
```

    ## ggparallel gglogo stat590f ggmapr rotations ggpcp

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
