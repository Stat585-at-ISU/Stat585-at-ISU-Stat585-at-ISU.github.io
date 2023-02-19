‘plyr’ to d’plyr’
================
Logan Johnson
2022-02-16

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Prompt:

The `plyr` package has by now been replaced by other, even faster
packages, but the idea of *Split, apply, combine* is as relevant as
ever.

Read the paper [The Split-Apply-Combine Strategy for Data
Analysis](https://www.jstatsoft.org/article/view/v040i01) by Hadley
Wickham.

Write a blog post addressing the following questions:

1.  The R code for the split-apply-combine paper is posted with the
    paper. Pick one of the examples demonstrating `plyr` functionality
    (such as `dlply` or `ddply`, …) and rewrite the example using
    functionality from the package `dplyr`. Make sure that your example
    works and the results are identical.

## Example from plyr package

``` r
library(plyr)

baseball <- baseball

head(baseball[c("id","year")], n = 10)
#>            id year
#> 4   ansonca01 1871
#> 44  forceda01 1871
#> 68  mathebo01 1871
#> 99  startjo01 1871
#> 102 suttoez01 1871
#> 106 whitede01 1871
#> 113  yorkto01 1871
#> 121 ansonca01 1872
#> 143 burdoja01 1872
#> 167 forceda01 1872

baseball_1 <- ddply(baseball, .(id), transform, 
  cyear = year - min(year) + 1)

head(baseball_1[c("id","year","cyear")], n = 10)
#>           id year cyear
#> 1  aaronha01 1954     1
#> 2  aaronha01 1955     2
#> 3  aaronha01 1956     3
#> 4  aaronha01 1957     4
#> 5  aaronha01 1958     5
#> 6  aaronha01 1959     6
#> 7  aaronha01 1960     7
#> 8  aaronha01 1961     8
#> 9  aaronha01 1962     9
#> 10 aaronha01 1963    10

tail(baseball_1[c("id","year","cyear")], n = 10)
#>              id year cyear
#> 21690 zimmech01 1895    12
#> 21691 zimmech01 1896    13
#> 21692 zimmech01 1897    14
#> 21693 zimmech01 1898    15
#> 21694 zimmech01 1899    16
#> 21695 zimmech01 1899    16
#> 21696 zimmech01 1900    17
#> 21697 zimmech01 1901    18
#> 21698 zimmech01 1902    19
#> 21699 zimmech01 1903    20
```

## Remade with dplyr package

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:plyr':
#> 
#>     arrange, count, desc, failwith, id, mutate, rename, summarise,
#>     summarize
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

baseball <- baseball

head(baseball[c("id","year")], n = 10)
#>            id year
#> 4   ansonca01 1871
#> 44  forceda01 1871
#> 68  mathebo01 1871
#> 99  startjo01 1871
#> 102 suttoez01 1871
#> 106 whitede01 1871
#> 113  yorkto01 1871
#> 121 ansonca01 1872
#> 143 burdoja01 1872
#> 167 forceda01 1872

baseball_2 <- baseball %>% 
  arrange(id) %>% 
  group_by(id) %>% 
  mutate(cyear = year-min(year) + 1)

head(baseball_2[c("id","year","cyear")], n = 10)
#> # A tibble: 10 × 3
#> # Groups:   id [1]
#>    id         year cyear
#>    <chr>     <int> <dbl>
#>  1 aaronha01  1954     1
#>  2 aaronha01  1955     2
#>  3 aaronha01  1956     3
#>  4 aaronha01  1957     4
#>  5 aaronha01  1958     5
#>  6 aaronha01  1959     6
#>  7 aaronha01  1960     7
#>  8 aaronha01  1961     8
#>  9 aaronha01  1962     9
#> 10 aaronha01  1963    10

tail(baseball_2[c("id","year","cyear")], n = 10)
#> # A tibble: 10 × 3
#> # Groups:   id [1]
#>    id         year cyear
#>    <chr>     <int> <dbl>
#>  1 zimmech01  1895    12
#>  2 zimmech01  1896    13
#>  3 zimmech01  1897    14
#>  4 zimmech01  1898    15
#>  5 zimmech01  1899    16
#>  6 zimmech01  1899    16
#>  7 zimmech01  1900    17
#>  8 zimmech01  1901    18
#>  9 zimmech01  1902    19
#> 10 zimmech01  1903    20
```

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

- I’m not super familiar with base R functions in the
  split-apply-combine area. I know of apply and lapply, and I have heard
  of some of the other functions. I honestly have not used them before.
  I do feel like they take more work to achieve the similar function of
  dplyr. The coding and naming of the base R functions is confusing to
  me. I do think that there are probably use cases for these functions
  compared with the dplyr package. Overall, I do not think that the base
  R functions for the split-apply-combine strategy are sufficient
  because they are not as user accessible for normal people. It would
  take more time and understanding of R to be able to achieve a similar
  output in base R compared to dplyr.

3.  The ChatGPT response to the prompt “Describe the split-apply-combine
    paradigm” is given below. Generally, the chatbot’s answers are
    decent. ChatGPT does have problems getting details right. Which
    details would you change in the response?

> The “split-apply-combine” paradigm is a data analysis strategy used in
> statistics and data science to analyze grouped data. It consists of
> three steps:
>
> Split: The data is first split into groups based on one or more
> variables of interest.
>
> Apply: A specific operation or function is applied to each group of
> data, usually for the purpose of aggregating, summarizing, or
> transforming the data within each group.
>
> Combine: The results of the operation applied to each group are then
> combined and returned as a single output.
>
> The split-apply-combine paradigm is particularly useful in cases where
> the data cannot be analyzed as a whole and instead must be analyzed in
> smaller, more manageable chunks. This allows for more efficient data
> processing and improved scalability. The paradigm is commonly
> implemented using tools such as the “groupby” function in the R and
> Python programming languages, and the “dplyr” library in R.

- I think I would change the last part of the response. I don’t think
  that the data is necessarily split into chunks but rather managed in a
  more efficient manner that allows for a function or modification to be
  applied throughout the desired parts of the data.

You can write your answers directly the `README.Rmd` file. Make sure
that the file knits (you will need to activate any packages your use in
your code chunks with a call to `library(xxx)`, where xxx is the name of
the package, such as `plyr` ). Commit your changes and push to your
repo; add any files in the `README_files` directory to your repository.
