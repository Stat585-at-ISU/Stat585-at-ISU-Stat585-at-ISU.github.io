Web scraping etiquette …
================
Motina
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
    Give examples, or cite your sources.** Here are three key takeaways
    from the article:

> **Use public APIs whenever possible:** Instead of scraping data
> directly from a website, use its API if it has it. By using an API,
> you’ll get the data in a structured and consistent format and you’ll
> reduce the website’s server load.

> **Respect the website’s terms of use:** When scraping data from a
> website, be transparent about your intentions. Providing a clear user
> agent string identifies you as a scraper rather than a malicious bot,
> requesting data at a reasonable rate, and only saving the data you
> need. If you keep anything, make sure you don’t pass it off as your
> own.

> **Provide value:** Instead of just taking data from a website, try to
> give something back. The data can be used in a way to benefit the
> website or its users, such as driving traffic to the site, crediting
> it in an article, or finding other ways to use it.

Source: \[James Densmore’s article “Ethics in Web Scraping”\]
(<https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01>)

2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**

For `robots.txt`, it’s a file placed in a site’s root directory that
tells web scrapers how they can crawl the site. You can allow or
disallow certain web scraping activities in the file, or define how
often requests should be made. The `robots.txt` file on Twitter, for
example, doesn’t let scrapers crawl the `/search` and `/notifications`
sections of the site. Therefore, web scrapers shouldn’t scrape or access
these parts of the site without permission.

3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

``` r
library(polite)
library(rvest)
library(purrr)
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
# Set the URL to scrape
url <- "https://www.nytimes.com/elections/2016/results/iowa"

# Create a polite session to request permission to scrape the site
session <- bow(url)

# Use the session to retrieve the HTML content of the page
html <- scrape(session)

# Extract the tables from the HTML using rvest
tables <- html %>% html_table(fill = TRUE)

# Print a summary of each table using purrr 
tables %>% purrr::map(summary) %>% head()
```

    ## [[1]]
    ##  Candidate       Candidate            Party              Votes          
    ##  Mode:logical   Length:11          Length:11          Length:11         
    ##  NA's:11        Class :character   Class :character   Class :character  
    ##                 Mode  :character   Mode  :character   Mode  :character  
    ##      Pct.                              E.V.          
    ##  Length:11          Mode:logical   Length:11         
    ##  Class :character   NA's:11        Class :character  
    ##  Mode  :character                  Mode  :character  
    ## 
    ## [[2]]
    ##  Vote by county        Trump             Clinton         
    ##  Length:99          Length:99          Length:99         
    ##  Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character  
    ## 
    ## [[3]]
    ##  Candidate       Candidate            Party              Votes          
    ##  Mode:logical   Length:6           Length:6           Length:6          
    ##  NA's:6         Class :character   Class :character   Class :character  
    ##                 Mode  :character   Mode  :character   Mode  :character  
    ##      Pct.                         
    ##  Length:6           Mode:logical  
    ##  Class :character   NA's:6        
    ##  Mode  :character                 
    ## 
    ## [[4]]
    ##  Vote by county       Grassley            Judge          
    ##  Length:99          Length:99          Length:99         
    ##  Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character  
    ## 
    ## [[5]]
    ##  District\n          Dist.    Leader                            
    ##  Min.   :1.00              Length:4           Length:4          
    ##  1st Qu.:1.75              Class :character   Class :character  
    ##  Median :2.50              Mode  :character   Mode  :character  
    ##  Mean   :2.50                                                   
    ##  3rd Qu.:3.25                                                   
    ##  Max.   :4.00                                                   
    ##      Rpt.                         
    ##  Length:4           Mode:logical  
    ##  Class :character   NA's:4        
    ##  Mode  :character                 
    ##                                   
    ##                                   
    ##                                   
    ## 
    ## [[6]]
    ##  Seat\n          Seat    Leader                                 Rpt.          
    ##  Min.   : 2           Length:25          Length:25          Length:25         
    ##  1st Qu.:14           Class :character   Class :character   Class :character  
    ##  Median :26           Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :26                                                                   
    ##  3rd Qu.:38                                                                   
    ##  Max.   :50                                                                   
    ##                
    ##  Mode:logical  
    ##  NA's:25       
    ##                
    ##                
    ##                
    ## 

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)
