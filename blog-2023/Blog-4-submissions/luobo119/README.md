Split-apply-combine
================
yc bai
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

``` r
library(plyr)
library(dplyr)
```

``` r
#plyr example
baseball_plyr <- ddply(baseball, .(id), transform, 
  cyear = year - min(year) + 1)
#using dplyr 
baseball_dplyr = baseball %>% group_by(id) %>% mutate(cyear = year - min(year) + 1) %>%
  arrange(id) %>% as.data.frame()
```

**Head of ‘plyr’ result**

``` r
head(baseball_plyr)
#>          id year stint team lg   g  ab   r   h X2b X3b hr rbi sb cs bb so ibb
#> 1 aaronha01 1954     1  ML1 NL 122 468  58 131  27   6 13  69  2  2 28 39  NA
#> 2 aaronha01 1955     1  ML1 NL 153 602 105 189  37   9 27 106  3  1 49 61   5
#> 3 aaronha01 1956     1  ML1 NL 153 609 106 200  34  14 26  92  2  4 37 54   6
#> 4 aaronha01 1957     1  ML1 NL 151 615 118 198  27   6 44 132  1  1 57 58  15
#> 5 aaronha01 1958     1  ML1 NL 153 601 109 196  34   4 30  95  4  1 59 49  16
#> 6 aaronha01 1959     1  ML1 NL 154 629 116 223  46   7 39 123  8  0 51 54  17
#>   hbp sh sf gidp cyear
#> 1   3  6  4   13     1
#> 2   3  7  4   20     2
#> 3   2  5  7   21     3
#> 4   0  0  3   13     4
#> 5   1  0  3   21     5
#> 6   4  0  9   19     6
```

**Head of ‘dplyr’ result**

``` r
head(baseball_dplyr)
#>          id year stint team lg   g  ab   r   h X2b X3b hr rbi sb cs bb so ibb
#> 1 aaronha01 1954     1  ML1 NL 122 468  58 131  27   6 13  69  2  2 28 39  NA
#> 2 aaronha01 1955     1  ML1 NL 153 602 105 189  37   9 27 106  3  1 49 61   5
#> 3 aaronha01 1956     1  ML1 NL 153 609 106 200  34  14 26  92  2  4 37 54   6
#> 4 aaronha01 1957     1  ML1 NL 151 615 118 198  27   6 44 132  1  1 57 58  15
#> 5 aaronha01 1958     1  ML1 NL 153 601 109 196  34   4 30  95  4  1 59 49  16
#> 6 aaronha01 1959     1  ML1 NL 154 629 116 223  46   7 39 123  8  0 51 54  17
#>   hbp sh sf gidp cyear
#> 1   3  6  4   13     1
#> 2   3  7  4   20     2
#> 3   2  5  7   21     3
#> 4   0  0  3   13     4
#> 5   1  0  3   21     5
#> 6   4  0  9   19     6
```

**Results are identical**

``` r
all.equal(baseball_plyr, baseball_dplyr)
#> [1] TRUE
```

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

**I know the functions ‘apply’, ‘lapply’, ‘sapply’ and ‘vapply’ support
the split-apply-combine strategy. But the input of ‘apply’ can only be
an array, and the inputs for ‘lapply’, ‘sapply’ and ‘vapply’ are a
vector. So it’s not sufficient. Packages like ‘plyr’ and ‘dplyr’ can
take in more types of data and the functions are more flexible. For
example, you can specify variables on which the data is split. But you
can only split the data by row or by column in ‘apply’.**

3.  The ChatGPT response to the prompt “Describe the split-apply-combine
    paradigm” is given below. Generally, the chatbot’s answers are
    decent. ChatGPT does have problems getting details right. Which
    details would you change in the response?

> The “split-apply-combine” paradigm is a data analysis strategy used in
> statistics and data science ~~to analyze grouped data~~. It consists
> of three steps:
>
> Split: The data is first split into groups based on one or more
> variables of interest, **or split into pieces based on a given
> splitting scheme**.
>
> Apply: A specific operation or function is applied to each **piece**
> ~~group~~ of data **independently**, usually for the purpose of
> aggregating, summarizing, **modeling**, or transforming the data
> within each group.
>
> Combine: The results of the operation applied to each **piece**
> ~~group~~ are then combined and returned as a single output.
>
> The split-apply-combine paradigm is particularly useful in cases where
> the data cannot be analyzed as a whole and instead must be analyzed in
> smaller, more manageable chunks, **or you want to apply the same
> operations on each piece of data**. This allows for more efficient
> data processing and improved scalability. The paradigm is commonly
> implemented using tools such as the “groupby” function in ~~the R
> and~~ Python ~~programming languages~~, and the “dplyr” library in R.

You can write your answers directly the `README.Rmd` file. Make sure
that the file knits (you will need to activate any packages your use in
your code chunks with a call to `library(xxx)`, where xxx is the name of
the package, such as `plyr` ). Commit your changes and push to your
repo; add any files in the `README_files` directory to your repository.
