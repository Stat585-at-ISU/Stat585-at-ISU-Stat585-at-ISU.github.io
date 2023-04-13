Being kind to Wikipedia
================
Landon Getting
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

    Prior to the reading, I was not aware of User Agent strings or
    robot.txt files. I think these two concepts, along with public APIs,
    are important to understand as an ethical web scraper. Despite using
    packages like rvest and Python’s Beautiful Soup in the past, I had
    never encountered the need for a User Agent string or interaction
    with a robots.txt file. James Densmore did a great job outlining
    these topics in his [towardsdatascience
    article](https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01).
    If everyone introduced themselves to the site owners via a User
    Agent string, checked what the house rules were via the robot.txt
    file, and utilized public API’s when available, site owners might be
    less likely to dissuade scrapping.

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

    The ROBOT.txt can prevent scrappers from accessing data whether that
    is a web page, media file, or resource files. In a [informative
    article](https://developers.google.com/search/docs/crawling-indexing/robots/intro)
    by Google, the search giant explains how website owners use
    robot.txt to indicate which URLs they would like crawled by Google
    and to avoid too much traffic.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

    I utilized the polite package to scrap information on notable table
    tennis players from
    [Wikipedia](https://en.wikipedia.org/wiki/Table_tennis).

First, I started by using `bow()` to introduce myself to the page.

``` r
library(polite)
library(rvest)

session <- bow("https://en.wikipedia.org/wiki/Table_tennis")
```

Next, I let the `scrape()` function know that I had properly introduced
myself and passed the result to `html_nodes()` to get the table I was
looking for by specifying the class. I passed the html to the
`html_table()` function to nicely parse it into appealing R terms for
me. Finally, I printed my object and reflected on how much I like
Wikipedia.

``` r
result <- scrape(session) |>
  html_nodes(".wikitable") |>
  html_table()

result
```

    ## [[1]]
    ## # A tibble: 11 x 7
    ##    Name            Gender Nationality `Times won`  `Times won` `Times won` ``   
    ##    <chr>           <chr>  <chr>       <chr>        <chr>       <chr>       <chr>
    ##  1 Name            Gender Nationality Olympics     World Cham~ World Cup   ""   
    ##  2 Jan-Ove Waldner Male   Sweden      1 (1992)     2 (1989, 1~ 1 (1990)    "[76~
    ##  3 Deng Yaping     Female China       2 (1992, 19~ 3 (1991, 1~ 1 (1996)    "[77~
    ##  4 Liu Guoliang    Male   China       1 (1996)     1 (1999)    1 (1996)    "[78~
    ##  5 Wang Nan        Female China       1 (2000)     3 (1999, 2~ 4 (1997, 1~ "[79~
    ##  6 Kong Linghui    Male   China       1 (2000)     1 (1995)    1 (1995)    "[80~
    ##  7 Zhang Yining    Female China       2 (2004, 20~ 2 (2005, 2~ 4 (2001, 2~ "[81~
    ##  8 Zhang Jike      Male   China       1 (2012)     2 (2011, 2~ 2 (2011, 2~ "[82~
    ##  9 Li Xiaoxia      Female China       1 (2012)     1 (2013)    1 (2008)    "[83~
    ## 10 Ding Ning       Female China       1 (2016)     3 (2011, 2~ 2 (2011, 2~ "[84~
    ## 11 Ma Long         Male   China       2 (2016, 20~ 3 (2015, 2~ 2 (2012, 2~  <NA>
