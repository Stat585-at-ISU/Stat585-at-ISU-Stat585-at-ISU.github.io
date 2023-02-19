plyr and dplyr
================
Charchit Shukla
2022-02-16

<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
library(ggplot2)
library(plyr)
library(reshape)
#> 
#> Attaching package: 'reshape'
#> The following objects are masked from 'package:plyr':
#> 
#>     rename, round_any
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following object is masked from 'package:reshape':
#> 
#>     rename
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

data <- baseball

rbi <- ddply(baseball, .(year), summarise, mean_rbi = mean(rbi, na.rm = TRUE))
head(rbi)
#>   year mean_rbi
#> 1 1871 22.28571
#> 2 1872 20.53846
#> 3 1873 30.92308
#> 4 1874 29.00000
#> 5 1875 31.58824
#> 6 1876 30.13333

#using dplyr package

b2 <- group_by(data, year)
rbi2 <- summarize(b2,mean(rbi))
head(rbi2)
#> # A tibble: 6 × 2
#>    year `mean(rbi)`
#>   <int>       <dbl>
#> 1  1871        22.3
#> 2  1872        20.5
#> 3  1873        30.9
#> 4  1874        29  
#> 5  1875        31.6
#> 6  1876        30.1
```

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

Check the code above.

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

The base R has functions like arrange, apply which can be combined with
other functions like aggregate to use the split-combine strategy or even
simply data\$variable to select the variable. Other base function like
split, subset, cbind, rbind etc. can also be used.

These base functions can get the job done for simpler datasets but the
users have to go through inconsistent syntax to find the solution.
However, it will be very hard working with higher dimensional data and
different data structures as the paper mentioned.

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

I think ChatGPT explained it well enough. The first thing which I caught
was “groupby” function it has given as answer. Clearly, I have used
above is “group_by” but ChatGPT mentioned it confidently in the
quotation marks that it will be “groupby”. In python as far as I know,
the library is pandas. So, that does not seem right in the response
above.

I will be interested in hearing other students thoughts on this and what
I mistakes I did not catch in the ChatGPT response.

You can write your answers directly the `README.Rmd` file. Make sure
that the file knits (you will need to activate any packages your use in
your code chunks with a call to `library(xxx)`, where xxx is the name of
the package, such as `plyr` ). Commit your changes and push to your
repo; add any files in the `README_files` directory to your repository.
