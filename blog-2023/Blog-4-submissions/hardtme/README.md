Split-Apply-Combine
================
Marie Hardt
2023-02-16

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

I revisited one of the baseball case study examples from section 5.1 of
the paper. The code for the original example is given below (with a
modification to save the new dataset as `plyr_baseball` instead of
`baseball` as in the paper):

``` r
library(plyr)
baseball_plyr <- ddply(baseball, .(id), transform, 
  cyear = year - min(year) + 1)
```

We’ll now look at the first fifteen rows and last fifteen rows of the
new `baseball_plyr` dataset.

``` r
head(baseball_plyr, 15)
#>           id year stint team lg   g  ab   r   h X2b X3b hr rbi sb cs bb so ibb
#> 1  aaronha01 1954     1  ML1 NL 122 468  58 131  27   6 13  69  2  2 28 39  NA
#> 2  aaronha01 1955     1  ML1 NL 153 602 105 189  37   9 27 106  3  1 49 61   5
#> 3  aaronha01 1956     1  ML1 NL 153 609 106 200  34  14 26  92  2  4 37 54   6
#> 4  aaronha01 1957     1  ML1 NL 151 615 118 198  27   6 44 132  1  1 57 58  15
#> 5  aaronha01 1958     1  ML1 NL 153 601 109 196  34   4 30  95  4  1 59 49  16
#> 6  aaronha01 1959     1  ML1 NL 154 629 116 223  46   7 39 123  8  0 51 54  17
#> 7  aaronha01 1960     1  ML1 NL 153 590 102 172  20  11 40 126 16  7 60 63  13
#> 8  aaronha01 1961     1  ML1 NL 155 603 115 197  39  10 34 120 21  9 56 64  20
#> 9  aaronha01 1962     1  ML1 NL 156 592 127 191  28   6 45 128 15  7 66 73  14
#> 10 aaronha01 1963     1  ML1 NL 161 631 121 201  29   4 44 130 31  5 78 94  18
#> 11 aaronha01 1964     1  ML1 NL 145 570 103 187  30   2 24  95 22  4 62 46   9
#> 12 aaronha01 1965     1  ML1 NL 150 570 109 181  40   1 32  89 24  4 60 81  10
#> 13 aaronha01 1966     1  ATL NL 158 603 117 168  23   1 44 127 21  3 76 96  15
#> 14 aaronha01 1967     1  ATL NL 155 600 113 184  37   3 39 109 17  6 63 97  19
#> 15 aaronha01 1968     1  ATL NL 160 606  84 174  33   4 29  86 28  5 64 62  23
#>    hbp sh sf gidp cyear
#> 1    3  6  4   13     1
#> 2    3  7  4   20     2
#> 3    2  5  7   21     3
#> 4    0  0  3   13     4
#> 5    1  0  3   21     5
#> 6    4  0  9   19     6
#> 7    2  0 12    8     7
#> 8    2  1  9   16     8
#> 9    3  0  6   14     9
#> 10   0  0  5   11    10
#> 11   0  0  2   22    11
#> 12   1  0  8   15    12
#> 13   1  0  8   14    13
#> 14   0  0  6   11    14
#> 15   1  0  5   21    15
tail(baseball_plyr, 15)
#>              id year stint team lg   g  ab  r   h X2b X3b hr rbi sb cs bb so
#> 21685 zimmech01 1890     1  CL4 NL 125 444 54  95  16   6  2  57 15 NA 46 54
#> 21686 zimmech01 1891     1  CL4 NL 116 440 55 112  21   4  3  69 15 NA 33 49
#> 21687 zimmech01 1892     1  CL4 NL 111 413 63 108  29  13  1  64 18 NA 32 47
#> 21688 zimmech01 1893     1  CL4 NL  57 227 27  70  13   7  2  41  4 NA 16 15
#> 21689 zimmech01 1894     1  CL4 NL  90 341 55  97  20   5  4  65 14 NA 17 31
#> 21690 zimmech01 1895     1  CL4 NL  88 315 60 107  21   2  5  56 14 NA 33 30
#> 21691 zimmech01 1896     1  CL4 NL  91 336 46  93  18   3  3  46  4 NA 31 48
#> 21692 zimmech01 1897     1  CL4 NL  80 294 50  93  22   3  0  40  8 NA 25 NA
#> 21693 zimmech01 1898     1  CL4 NL  20  63  5  15   2   0  0   4  2 NA  5 NA
#> 21694 zimmech01 1899     1  CL4 NL  20  73  9  25   2   1  2  14  1 NA  5 NA
#> 21695 zimmech01 1899     2  LS3 NL  75 262 43  78  11   3  2  29  9 NA 22 NA
#> 21696 zimmech01 1900     1  PIT NL  82 271 27  80   7  10  0  35  4 NA 17 NA
#> 21697 zimmech01 1901     1  PIT NL  69 236 17  52   7   3  0  21  6 NA 20 NA
#> 21698 zimmech01 1902     1  PIT NL  42 142 13  38   4   2  0  17  4 NA 11 NA
#> 21699 zimmech01 1903     1  PHI NL  37 118  9  26   3   1  1  19  3 NA  9 NA
#>       ibb hbp sh sf gidp cyear
#> 21685  NA  11 NA NA   NA     7
#> 21686  NA   4 NA NA   NA     8
#> 21687  NA   7 NA NA   NA     9
#> 21688  NA   1 NA NA   NA    10
#> 21689  NA   5 NA NA   NA    11
#> 21690  NA   9  0 NA   NA    12
#> 21691  NA   9  5 NA   NA    13
#> 21692  NA   4  5 NA   NA    14
#> 21693  NA   1  4 NA   NA    15
#> 21694  NA   3  0 NA   NA    16
#> 21695  NA   8 10 NA   NA    16
#> 21696  NA  11  9 NA   NA    17
#> 21697  NA   4  7 NA   NA    18
#> 21698  NA   4  6 NA   NA    19
#> 21699  NA   3  3 NA   NA    20
```

Next, I’ll rewrite the example using functions from the `dply` package.

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
library(magrittr) # For pipe %>% 

baseball_dplyr <- baseball %>% 
                    dplyr::group_by(id) %>%
                    dplyr::mutate(cyear = year - min(year) + 1) %>% 
                    dplyr::arrange(id) # Arrange data as in baseball_plyr
```

We’ll now look at the first fifteen rows and last fifteen rows of the
new `baseball_dplyr` dataset after converting it from a tibble to a
dataframe to better match `baseball_plyr`.

``` r
baseball_dplyr <- as.data.frame(baseball_dplyr)
head(baseball_dplyr, 15)
#>           id year stint team lg   g  ab   r   h X2b X3b hr rbi sb cs bb so ibb
#> 1  aaronha01 1954     1  ML1 NL 122 468  58 131  27   6 13  69  2  2 28 39  NA
#> 2  aaronha01 1955     1  ML1 NL 153 602 105 189  37   9 27 106  3  1 49 61   5
#> 3  aaronha01 1956     1  ML1 NL 153 609 106 200  34  14 26  92  2  4 37 54   6
#> 4  aaronha01 1957     1  ML1 NL 151 615 118 198  27   6 44 132  1  1 57 58  15
#> 5  aaronha01 1958     1  ML1 NL 153 601 109 196  34   4 30  95  4  1 59 49  16
#> 6  aaronha01 1959     1  ML1 NL 154 629 116 223  46   7 39 123  8  0 51 54  17
#> 7  aaronha01 1960     1  ML1 NL 153 590 102 172  20  11 40 126 16  7 60 63  13
#> 8  aaronha01 1961     1  ML1 NL 155 603 115 197  39  10 34 120 21  9 56 64  20
#> 9  aaronha01 1962     1  ML1 NL 156 592 127 191  28   6 45 128 15  7 66 73  14
#> 10 aaronha01 1963     1  ML1 NL 161 631 121 201  29   4 44 130 31  5 78 94  18
#> 11 aaronha01 1964     1  ML1 NL 145 570 103 187  30   2 24  95 22  4 62 46   9
#> 12 aaronha01 1965     1  ML1 NL 150 570 109 181  40   1 32  89 24  4 60 81  10
#> 13 aaronha01 1966     1  ATL NL 158 603 117 168  23   1 44 127 21  3 76 96  15
#> 14 aaronha01 1967     1  ATL NL 155 600 113 184  37   3 39 109 17  6 63 97  19
#> 15 aaronha01 1968     1  ATL NL 160 606  84 174  33   4 29  86 28  5 64 62  23
#>    hbp sh sf gidp cyear
#> 1    3  6  4   13     1
#> 2    3  7  4   20     2
#> 3    2  5  7   21     3
#> 4    0  0  3   13     4
#> 5    1  0  3   21     5
#> 6    4  0  9   19     6
#> 7    2  0 12    8     7
#> 8    2  1  9   16     8
#> 9    3  0  6   14     9
#> 10   0  0  5   11    10
#> 11   0  0  2   22    11
#> 12   1  0  8   15    12
#> 13   1  0  8   14    13
#> 14   0  0  6   11    14
#> 15   1  0  5   21    15
tail(baseball_dplyr, 15)
#>              id year stint team lg   g  ab  r   h X2b X3b hr rbi sb cs bb so
#> 21685 zimmech01 1890     1  CL4 NL 125 444 54  95  16   6  2  57 15 NA 46 54
#> 21686 zimmech01 1891     1  CL4 NL 116 440 55 112  21   4  3  69 15 NA 33 49
#> 21687 zimmech01 1892     1  CL4 NL 111 413 63 108  29  13  1  64 18 NA 32 47
#> 21688 zimmech01 1893     1  CL4 NL  57 227 27  70  13   7  2  41  4 NA 16 15
#> 21689 zimmech01 1894     1  CL4 NL  90 341 55  97  20   5  4  65 14 NA 17 31
#> 21690 zimmech01 1895     1  CL4 NL  88 315 60 107  21   2  5  56 14 NA 33 30
#> 21691 zimmech01 1896     1  CL4 NL  91 336 46  93  18   3  3  46  4 NA 31 48
#> 21692 zimmech01 1897     1  CL4 NL  80 294 50  93  22   3  0  40  8 NA 25 NA
#> 21693 zimmech01 1898     1  CL4 NL  20  63  5  15   2   0  0   4  2 NA  5 NA
#> 21694 zimmech01 1899     1  CL4 NL  20  73  9  25   2   1  2  14  1 NA  5 NA
#> 21695 zimmech01 1899     2  LS3 NL  75 262 43  78  11   3  2  29  9 NA 22 NA
#> 21696 zimmech01 1900     1  PIT NL  82 271 27  80   7  10  0  35  4 NA 17 NA
#> 21697 zimmech01 1901     1  PIT NL  69 236 17  52   7   3  0  21  6 NA 20 NA
#> 21698 zimmech01 1902     1  PIT NL  42 142 13  38   4   2  0  17  4 NA 11 NA
#> 21699 zimmech01 1903     1  PHI NL  37 118  9  26   3   1  1  19  3 NA  9 NA
#>       ibb hbp sh sf gidp cyear
#> 21685  NA  11 NA NA   NA     7
#> 21686  NA   4 NA NA   NA     8
#> 21687  NA   7 NA NA   NA     9
#> 21688  NA   1 NA NA   NA    10
#> 21689  NA   5 NA NA   NA    11
#> 21690  NA   9  0 NA   NA    12
#> 21691  NA   9  5 NA   NA    13
#> 21692  NA   4  5 NA   NA    14
#> 21693  NA   1  4 NA   NA    15
#> 21694  NA   3  0 NA   NA    16
#> 21695  NA   8 10 NA   NA    16
#> 21696  NA  11  9 NA   NA    17
#> 21697  NA   4  7 NA   NA    18
#> 21698  NA   4  6 NA   NA    19
#> 21699  NA   3  3 NA   NA    20
```

The two datasets appear to be identical. We can also compare them with
`all.equal`:

``` r
all.equal(baseball_plyr, baseball_dplyr)
#> [1] TRUE
```

As we expected, `baseball_plyr` and `baseball_dplyr` are identical. This
means I successfully recreated the `plyr` example from the paper using
functions from the `dplyr` package.

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

    In the paper, Hadley Wickham mentioned several base `R` functions
    and how they compare to functions in the `plyr` package. These base
    `R` functions that support the split-apply-combine paradigm include
    `aggregate`, `apply`,`by`,`lapply`,`mapply`,`replicate`, and
    `sapply`.

I think these base `R` functions are sufficient to allow people to
implement the split-apply-combine paradigm in `R`. However, these
functions may not be the most efficient and user-friendly way to
implement the split-apply-combine paradigm in `R`.

Consider the following analogy: you have to take a long car trip in the
United States and you don’t especially care about the scenery or places
you visit along the way. Since you just want to get from point A to
point B in the most efficient way possible, the best route would be for
you to take interstate highways and major US highways. While you could
still get from point A to point B by driving along smaller roads like
state highways and county roads, your journey will likely take longer
and won’t be the most direct route. You also have a higher chance of
getting lost along the way.

In the analogy above, packages like `plyr` and `dplyr` are the
equivalent of driving on interstate highways and major US highways
during your long car trip. The functions in these packages allow you to
efficiently bring your data into the necessary form for the analyses
you’d like to run. The `plyr` and `dplyr` functions are written to
follow similar syntax within each package, so it’s easy to know what
code you have to write. Base `R` functions like `aggregate` and `apply`
are like driving on state highways and county roads during your road
trip. While these routes can get you to your destination, they are not
always straightforward and you’ll likely run into mishaps along the way.

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

I think that ChatGPT’s explanation that in the “apply” step, “\[a\]
*specific* \[emphasis added\] operation or function is applied to each
group of data…” almost makes it sound like each data group could have a
different function applied to it. It’s my understanding that under the
split-apply-combine paradigm, we do the same thing to all of the groups.
Here’s how I’d rewrite this portion:

> Apply: The same function is applied to each group in the data, usually
> to aggregate, summarize, or transform the data within each group.

As noted in class on February 14, 2023, ChatGPT made a mistake with the
“groupby” function in the last paragraph. While the appropriate function
is indeed called `groupby` in the `pandas` library for Python, the
function name in the R package `dplyr` is `group_by`.
