Split-apply-combine
================
Parvin Mohammadiarvejeh
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

# load the packages

``` r
library(plyr)
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
library(ggplot2)
```

# Load the data

``` r

data("baseball")
head(baseball)
#>            id year stint team lg  g  ab  r  h X2b X3b hr rbi sb cs bb so ibb
#> 4   ansonca01 1871     1  RC1    25 120 29 39  11   3  0  16  6  2  2  1  NA
#> 44  forceda01 1871     1  WS3    32 162 45 45   9   4  0  29  8  0  4  0  NA
#> 68  mathebo01 1871     1  FW1    19  89 15 24   3   1  0  10  2  1  2  0  NA
#> 99  startjo01 1871     1  NY2    33 161 35 58   5   1  1  34  4  2  3  0  NA
#> 102 suttoez01 1871     1  CL1    29 128 35 45   3   7  3  23  3  1  1  0  NA
#> 106 whitede01 1871     1  CL1    29 146 40 47   6   5  1  21  2  2  4  1  NA
#>     hbp sh sf gidp
#> 4    NA NA NA   NA
#> 44   NA NA NA   NA
#> 68   NA NA NA   NA
#> 99   NA NA NA   NA
#> 102  NA NA NA   NA
#> 106  NA NA NA   NA
summary(baseball)
#>       id                 year          stint           team          
#>  Length:21699       Min.   :1871   Min.   :1.000   Length:21699      
#>  Class :character   1st Qu.:1937   1st Qu.:1.000   Class :character  
#>  Mode  :character   Median :1970   Median :1.000   Mode  :character  
#>                     Mean   :1961   Mean   :1.093                     
#>                     3rd Qu.:1988   3rd Qu.:1.000                     
#>                     Max.   :2007   Max.   :4.000                     
#>                                                                      
#>       lg                  g                ab              r         
#>  Length:21699       Min.   :  0.00   Min.   :  0.0   Min.   :  0.00  
#>  Class :character   1st Qu.: 29.00   1st Qu.: 25.0   1st Qu.:  2.00  
#>  Mode  :character   Median : 59.00   Median :131.0   Median : 15.00  
#>                     Mean   : 72.82   Mean   :225.4   Mean   : 31.78  
#>                     3rd Qu.:125.00   3rd Qu.:435.0   3rd Qu.: 58.00  
#>                     Max.   :165.00   Max.   :705.0   Max.   :177.00  
#>                                                                      
#>        h               X2b             X3b               hr        
#>  Min.   :  0.00   Min.   : 0.00   Min.   : 0.000   Min.   : 0.000  
#>  1st Qu.:  4.00   1st Qu.: 0.00   1st Qu.: 0.000   1st Qu.: 0.000  
#>  Median : 32.00   Median : 5.00   Median : 1.000   Median : 1.000  
#>  Mean   : 61.76   Mean   :10.45   Mean   : 2.194   Mean   : 5.234  
#>  3rd Qu.:119.00   3rd Qu.:19.00   3rd Qu.: 3.000   3rd Qu.: 7.000  
#>  Max.   :257.00   Max.   :64.00   Max.   :28.000   Max.   :73.000  
#>                                                                    
#>       rbi               sb                cs             bb        
#>  Min.   :  0.00   Min.   :  0.000   Min.   : 0.0   Min.   :  0.00  
#>  1st Qu.:  1.00   1st Qu.:  0.000   1st Qu.: 0.0   1st Qu.:  1.00  
#>  Median : 14.00   Median :  1.000   Median : 0.0   Median : 11.00  
#>  Mean   : 29.59   Mean   :  5.168   Mean   : 2.1   Mean   : 22.49  
#>  3rd Qu.: 51.00   3rd Qu.:  5.000   3rd Qu.: 3.0   3rd Qu.: 38.00  
#>  Max.   :184.00   Max.   :130.000   Max.   :42.0   Max.   :232.00  
#>  NA's   :12       NA's   :250       NA's   :4525                   
#>        so              ibb               hbp               sh        
#>  Min.   :  0.00   Min.   :  0.000   Min.   : 0.000   Min.   : 0.000  
#>  1st Qu.:  4.00   1st Qu.:  0.000   1st Qu.: 0.000   1st Qu.: 0.000  
#>  Median : 19.00   Median :  0.000   Median : 0.000   Median : 1.000  
#>  Mean   : 29.26   Mean   :  2.292   Mean   : 1.543   Mean   : 3.388  
#>  3rd Qu.: 45.00   3rd Qu.:  3.000   3rd Qu.: 2.000   3rd Qu.: 5.000  
#>  Max.   :189.00   Max.   :120.000   Max.   :51.000   Max.   :52.000  
#>  NA's   :1305     NA's   :7528      NA's   :377      NA's   :960     
#>        sf              gidp       
#>  Min.   : 0.000   Min.   : 0.000  
#>  1st Qu.: 0.000   1st Qu.: 0.000  
#>  Median : 1.000   Median : 2.000  
#>  Mean   : 1.842   Mean   : 4.774  
#>  3rd Qu.: 3.000   3rd Qu.: 8.000  
#>  Max.   :19.000   Max.   :36.000  
#>  NA's   :7390     NA's   :5272
```

# Select the columns….

``` r
baseball_1 = select(baseball, id, year, ab, rbi)
head(baseball_1)
#>            id year  ab rbi
#> 4   ansonca01 1871 120  16
#> 44  forceda01 1871 162  29
#> 68  mathebo01 1871  89  10
#> 99  startjo01 1871 161  34
#> 102 suttoez01 1871 128  23
#> 106 whitede01 1871 146  21
```

# Drop the NAs

``` r
library(tidyr)
baseball_1 = drop_na(baseball_1)
summary(baseball_1)
#>       id                 year            ab             rbi        
#>  Length:21687       Min.   :1871   Min.   :  0.0   Min.   :  0.00  
#>  Class :character   1st Qu.:1937   1st Qu.: 25.0   1st Qu.:  1.00  
#>  Mode  :character   Median :1970   Median :131.0   Median : 14.00  
#>                     Mean   :1961   Mean   :225.4   Mean   : 29.59  
#>                     3rd Qu.:1988   3rd Qu.:435.0   3rd Qu.: 51.00  
#>                     Max.   :2007   Max.   :705.0   Max.   :184.00
```

# Group by the players by ID

``` r
players_df <- group_by(baseball_1, id)
players_df
#> # A tibble: 21,687 × 4
#> # Groups:   id [1,228]
#>    id         year    ab   rbi
#>    <chr>     <int> <int> <int>
#>  1 ansonca01  1871   120    16
#>  2 forceda01  1871   162    29
#>  3 mathebo01  1871    89    10
#>  4 startjo01  1871   161    34
#>  5 suttoez01  1871   128    23
#>  6 whitede01  1871   146    21
#>  7 yorkto01   1871   145    23
#>  8 ansonca01  1872   217    50
#>  9 burdoja01  1872   174    15
#> 10 forceda01  1872   130    16
#> # … with 21,677 more rows
```

# Create the career year using mutate function

``` r
players_df_cyear = mutate(players_df, cyear = year - min(year) + 1)
players_df_cyear
#> # A tibble: 21,687 × 5
#> # Groups:   id [1,228]
#>    id         year    ab   rbi cyear
#>    <chr>     <int> <int> <int> <dbl>
#>  1 ansonca01  1871   120    16     1
#>  2 forceda01  1871   162    29     1
#>  3 mathebo01  1871    89    10     1
#>  4 startjo01  1871   161    34     1
#>  5 suttoez01  1871   128    23     1
#>  6 whitede01  1871   146    21     1
#>  7 yorkto01   1871   145    23     1
#>  8 ansonca01  1872   217    50     2
#>  9 burdoja01  1872   174    15     1
#> 10 forceda01  1872   130    16     2
#> # … with 21,677 more rows
```

# Get the rows that ab is greater than 25

``` r
players_df_cyear_sub = filter(players_df_cyear, ab > 25)
```

# Add a column which is rbi/ab

``` r
players_df_cyear_sub = mutate(players_df_cyear, ratio_rbi_ab = rbi/ab)
players_df_cyear_sub
#> # A tibble: 21,687 × 6
#> # Groups:   id [1,228]
#>    id         year    ab   rbi cyear ratio_rbi_ab
#>    <chr>     <int> <int> <int> <dbl>        <dbl>
#>  1 ansonca01  1871   120    16     1       0.133 
#>  2 forceda01  1871   162    29     1       0.179 
#>  3 mathebo01  1871    89    10     1       0.112 
#>  4 startjo01  1871   161    34     1       0.211 
#>  5 suttoez01  1871   128    23     1       0.180 
#>  6 whitede01  1871   146    21     1       0.144 
#>  7 yorkto01   1871   145    23     1       0.159 
#>  8 ansonca01  1872   217    50     2       0.230 
#>  9 burdoja01  1872   174    15     1       0.0862
#> 10 forceda01  1872   130    16     2       0.123 
#> # … with 21,677 more rows
```

# Another solution that I had

# Compute the career year function

``` r
#compute_cyear <- function(player_id){
#sub_data = subset(baseball_1, id == player_id)
#cyear = transform(sub_data, cyear = year - min(year) + 1)
```

# Get the unique id for players and get the cyear using compute_cyear function

``` r
#players_id = unique(baseball_1$id)
#data = lapply(players_id,  compute_cyear)
```

# Subset the ab\>25 for all the data sets

``` r
#for (i in 1:length(players_id)) {  
#  data[[i]] = subset(data[[i]], ab>25)
#  data[[i]]$ratio_rbi_ab = data[[i]]$rbi/data[[i]]$ab
#}


#data[[6]]
```

# A function to plot the…

``` r




#plotpattern <- function(df) {
  
#  xlim <- range(df$cyear, na.rm=TRUE)
#  ylim <- range(df$ratio_rbi_ab, na.rm=TRUE)
#  qplot(cyear, ratio_rbi_ab, data = df, geom = "line",
#  xlim = xlim, ylim = ylim)
#}
```

``` r
#pdf("paths.pdf", width = 8, height = 4)



#lapply(data, plotpattern)
```

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

Parvin’s answer: Before this blog, I just knew the aggregate, apply,
lapply, sapply, tapply, filter, mutate, group_by, etc. These functions
are very useful to work with data set similar to “baseball” but I
noticed that they may not be enough efficient for the
split-apply-combine strategy. When we have a big data set that includes
many features, and it has several records for one unique observation
(like the one we see in the baseball that there are multiple records for
each player), it is hard to implement the split-apply-combine strategy
using the base R functions. I found the plyr package very useful.

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

Parvin’s answer: potential first change: The “split-apply-combine”
paradigm is a data analysis strategy used in statistics and data science
to transform and analyze large grouped data. It consists of main three
steps:

potential second change: Split: The first step is to split the data into
smaller, more manageable subsets. This is typically done based on one or
more categorical variables that are present in the data. For example,
you might split a customer database into subsets based on demographic
characteristics, such as age or gender.

potential third change: Apply: The second step is to apply a function or
calculation to each subset of data. This function should be able to
operate on the data independently, without requiring any knowledge of
the other subsets. The function can be any type of operation, such as a
statistical summary, a calculation, or a transformation of the data.

potential fourth change: Combine: The final step is to combine the
results of the applied function back together into a single result. This
is typically done by aggregating the results in some way, such as taking
the mean or sum of the results for each subset.

potential fifthe change: Overall, the split-apply-combine paradigm is a
powerful approach for analyzing large data sets because it allows for
complex calculations and operations to be performed on the data without
requiring a full scan of the entire data set. It can also be easily
parallelized, which makes it an efficient approach for analyzing large
data sets on distributed computing platforms.

You can write your answers directly the `README.Rmd` file. Make sure
that the file knits (you will need to activate any packages your use in
your code chunks with a call to `library(xxx)`, where xxx is the name of
the package, such as `plyr` ). Commit your changes and push to your
repo; add any files in the `README_files` directory to your repository.
