[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/r-eeBXSu)
Web scraping etiquette …
================
CdS
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
2.  **What is a ROBOTS.TXT file? Identify one instance and explain what
    it allows/prevents.**
3.  **Identify a website that you would like to scrape (or one an
    example from class) and implement a scrape using the `polite`
    package.**

Instructions:

Submit to your repo. Make sure that all of the github actions pass
(check menu item Actions - all of the actions should have green checks)

## Answers:

1 - **What are your main three takeaways for ethical web scraping? -
Give examples, or cite your sources.**

There are three main takeaways related to ethical web scraping that
caught my attention. The first one is to be respectful to the owner of
the data one is scraping. For example, the web scraping operation might
be very demanding on the server so trying to execute this operation as
smoothly as possible would be my first aim. This can be done by
minimizing the amount of requests sent to the server. The second aspect
that caught my attention was to be also respectful to the human users of
the website one is scraping. For example, the idea of web scraping only
outside of peak use hours is fascinating to me. It reduces the traffic
on the server and also does not interfere with the user experience. The
third and last aspect that I thought was extremely interesting was the
idea that, if an Application Programming Interface (API) is provided, to
avoid web scraping all together. This API will most likely be more
equiped to handle large requests than the website front end.

An example of how to apply a couple of these principles would be on how
to request weather data from [NASA POWER](https://power.larc.nasa.gov/).
Often I will have to send multiple requests for weather data but it is
important to try and minimize the amount of requests. Let us take a
look:

If we need to iterate over a list of locations for which we need data
for multiple years, for example, there are multiple ways to do it, but
some of them will be more gentle to the API server. In the following
example, we can see how a simple tweak in the code can change the number
of requests to the server from 62 to 2.

``` r
renv::init()
locations <- data.frame(location_name = c('Ames, IA', 'Fayetteville, AR'),
                        latitude = c(42, 36),
                        longitude = c(94, 94))

locations <- merge(locations, 
                   data.frame(year = 1990:2020))

head(locations)
```

    ##      location_name latitude longitude year
    ## 1         Ames, IA       42        94 1990
    ## 2 Fayetteville, AR       36        94 1990
    ## 3         Ames, IA       42        94 1991
    ## 4 Fayetteville, AR       36        94 1991
    ## 5         Ames, IA       42        94 1992
    ## 6 Fayetteville, AR       36        94 1992

``` r
dim(locations)
```

    ## [1] 62  4

If we need the data for each of these locations at each one of these
years, one might be inclined to do the following loop:

``` r
weather_all <- data.frame()
time.start <- Sys.time()
for (i in 1:dim(locations)[1]) {
  
  dates <- c(sprintf('%1$s-01-01', locations$year[i]),
             sprintf('%1$s-12-31', locations$year[i]))
  
  lonlat <- c(locations$longitude[i], locations$latitude[i])
  
  weather_ind <- nasapower::get_power(community = "AG", pars = c("T2M_MAX", 
    "T2M_MIN", "ALLSKY_SFC_SW_DWN", "PRECTOTCORR", "RH2M", 
    "WS2M"), dates = dates, lonlat = lonlat, temporal_api = "daily")
  
  weather_ind$location_name <- locations$location_name[i]
  weather_all <- rbind(weather_all, weather_ind)
 
}
time.end <- Sys.time()
print(time.end - time.start)
```

    ## Time difference of 3.099758 mins

The previous code would have sent 62 separate requests to the NASA POWER
server. The following loop will retrieve the same information but with
only 3% of the requests. This example uses an API but the same principle
can be applied to the front face of a website.

``` r
search_parameters <- do.call(rbind, 
                            by(locations, locations$location_name, 
                               function(df) data.frame(df[1, c('location_name', 'longitude', 'latitude')],
                               min_year = min(df$year), 
                               max_year = max(df$year))))

time.start <- Sys.time()


weather_all <- data.frame()

for (i in 1:dim(search_parameters)[1]) {
  
  dates <- c(sprintf('%1$s-01-01', search_parameters$min_year[i]),
             sprintf('%1$s-12-31', search_parameters$max_year[i]))
  
  lonlat <- c(search_parameters$longitude[i], search_parameters$latitude[i])
  
  weather_ind <- nasapower::get_power(community = "AG", pars = c("T2M_MAX", 
    "T2M_MIN", "ALLSKY_SFC_SW_DWN", "PRECTOTCORR", "RH2M", 
    "WS2M"), dates = dates, lonlat = lonlat, temporal_api = "daily")
  
  weather_ind$location_name <- search_parameters$location_name[i]
  weather_all <- rbind(weather_all, weather_ind)
 
}
time.end <- Sys.time()
print(time.end - time.start)
```

    ## Time difference of 7.823604 secs

2 - **What is a ROBOTS.TXT file? Identify one instance and explain what
it allows/prevents.**

The robots.txt file is a file that tells bots instructions of where the
bot is allowed to crawl or not. It is a convention and it is a sign of
good faith to respect the robots.txt file. The file allows or disallows
certain behaviors of bots. These rules can be implemented globally or
for specific bots.

An example is the robots.txt file from
[https://www.iastate.edu](https://www.iastate.edu/robots.txt). It
specific disallows not clean URLs.

    # Paths (no clean URLs)
    Disallow: /index.php/admin/
    Disallow: /index.php/comment/reply/
    Disallow: /index.php/filter/tips
    Disallow: /index.php/node/add/
    Disallow: /index.php/search/
    Disallow: /index.php/user/password
    Disallow: /index.php/user/register
    Disallow: /index.php/user/login
    Disallow: /index.php/user/logout
    Disallow: /index.php/media/oembed
    Disallow: /index.php/*/media/oembed

3- **Identify a website that you would like to scrape (or one an example
from class) and implement a scrape using the `polite` package.**

``` r
library(polite)
```

    ## Warning: package 'polite' was built under R version 4.2.3

``` r
library(rvest)
```

    ## Warning: package 'rvest' was built under R version 4.2.3

``` r
library(readr)
```

    ## 
    ## Attaching package: 'readr'

    ## The following object is masked from 'package:rvest':
    ## 
    ##     guess_encoding

``` r
session <- bow("https://www.nytimes.com/elections/2016/results/iowa", force = TRUE)
result <- scrape(session, query=list(t="semi-soft", per_page=100))

tables <- result %>% html_table(fill=TRUE)
tables[[2]]
```

    ## # A tibble: 99 × 3
    ##    `Vote by county` Trump  Clinton
    ##    <chr>            <chr>  <chr>  
    ##  1 Polk             93,492 119,804
    ##  2 Linn             48,390 58,935 
    ##  3 Scott            39,149 40,440 
    ##  4 Johnson          21,044 50,200 
    ##  5 Black Hawk       27,476 32,233 
    ##  6 Story            19,458 25,709 
    ##  7 Dubuque          23,460 22,850 
    ##  8 Woodbury         24,727 16,210 
    ##  9 Pottawattamie    24,447 15,355 
    ## 10 Dallas           19,339 15,701 
    ## # … with 89 more rows

``` r
ia_results <- tables[[2]] 
ia_results$Trump <- with(ia_results,  parse_number(Trump))
ia_results$Clinton <- with(ia_results,  parse_number(Clinton))

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

``` r
renv::snapshot()
```

    ## * The lockfile is already up to date.
