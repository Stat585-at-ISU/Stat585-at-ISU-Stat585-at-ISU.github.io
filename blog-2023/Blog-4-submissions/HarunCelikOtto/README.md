Split-Apply-Combine Post
================
Harun Celik
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

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

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

You can write your answers directly the `README.Rmd` file. Make sure
that the file knits (you will need to activate any packages your use in
your code chunks with a call to `library(xxx)`, where xxx is the name of
the package, such as `plyr` ). Commit your changes and push to your
repo; add any files in the `README_files` directory to your repository.

\#Answers

## Question One

### Code Selection

I wanted to work with a simple example from Hadley Wickham’s code so
that I could better understand in detail what was happening. For this
reason, I chose to work with a chunk of code that used `ddply` to first
group_by the column `$id`, and then to create a new column called
`$cyear` using a base R `transform()` function.

### Here is the original code in `plyr`:

``` r
library("ggplot2")
library("plyr")
options(digits = 3)
options(prompt = "R> ")
```

``` r
#Changed variable name to baseball_plyr
baseball_plyr <- ddply(baseball, .(id), transform, 
  cyear = year - min(year) + 1)
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

Here is the output replicated in `dplyr`:

``` r
library(dplyr)
```

``` r
baseball_dplyr <- baseball %>%
  group_by(id) %>%
  mutate(cyear = year - min(year) + 1)
head(baseball_dplyr)
#> # A tibble: 6 × 23
#> # Groups:   id [6]
#>   id      year stint team  lg        g    ab     r     h   X2b   X3b    hr   rbi
#>   <chr>  <int> <int> <chr> <chr> <int> <int> <int> <int> <int> <int> <int> <int>
#> 1 anson…  1871     1 RC1   ""       25   120    29    39    11     3     0    16
#> 2 force…  1871     1 WS3   ""       32   162    45    45     9     4     0    29
#> 3 mathe…  1871     1 FW1   ""       19    89    15    24     3     1     0    10
#> 4 start…  1871     1 NY2   ""       33   161    35    58     5     1     1    34
#> 5 sutto…  1871     1 CL1   ""       29   128    35    45     3     7     3    23
#> 6 white…  1871     1 CL1   ""       29   146    40    47     6     5     1    21
#> # … with 10 more variables: sb <int>, cs <int>, bb <int>, so <int>, ibb <int>,
#> #   hbp <int>, sh <int>, sf <int>, gidp <int>, cyear <dbl>
```

### Discussion

In both cases, the input and output is a data frame. While the code is
less intuitive to understand at first glance in `ddply` the input/output
formats are represented easier through the `dd` notation. Both codes
group by `$id` and create a new column that is called `$cyear` with the
cumulative year of a player’s career. The `dplyr` package makes use of
the pipeline operator `%>%` to streamline the process of
split-apply-combine whereas `ddply` looks more similar to how the
`apply` functions take care of this paradigm in base r. One interesting
difference that I never paid attention to before was that the `str()`
function produces different results because of the `group_by()` function
in `dplyr`. It looks like the `group_by()` function creates nested
structures when calling `str()` on the data frame.

## Question Two

### Discussion

Until recently, I wasn’t following the differences between `base r` and
the `tidyverse` so the only base function I am aware of that follows
this split-apply-combine paradigm are the `apply` functions.

``` r
by(baseball$g, baseball$id, mean) |>
  head()
#> baseball$id
#> aaronha01 abernte02 adairje01 adamsba01 adamsbo03 adcocjo01 
#>     143.4      40.1      77.7      25.4      85.4     115.2
```

The code above uses `by` which serves as a wrapper for `tapply` and
while it does calculate the mean of `$g` by `$id`, the information of
the output is not as detailed as when run with the `dplyr` functions. I
also found it difficult to work with the syntax of the new base pipe
`|>` operator despite it serving a similar functionality to the more
widely utilized `magrittr` pipe operator.

## Question Three

Throughout the article, Hadley Wickham demonstrates the importance of
working with the split-apply-combine paradigm efficiently. This is
something that ChatGPT did not pick up on in their answer. The answer
from the AI for instance doesn’t mention that in the “split” section,
memory-saving methods, like the ones introduced by `plyr`, are an
important process of working through the paradigm. The AI also doesn’t
discuss the limitations of the split-apply-combine method. An important
limitation to the paradigm, especially through use of `plyr` is that
“each piece of data \[is\] processed only once and independently of all
other pieces” (Wickham, 2011). This is an important element of the
paradigm that separates it from advanced looping functions.

I have to admit that ChatGPT’s answer is surprisingly concise even if it
is a little generalized. It would be interesting to see how it answers
more particular questions about the paradigm like, “what are the
limitations of the split-apply-combine paradigm?”
