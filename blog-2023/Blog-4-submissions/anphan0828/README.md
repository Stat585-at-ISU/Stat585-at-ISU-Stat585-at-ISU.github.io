Split-apply-combine
================
An Phan
2023-02-16

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Prompt:

The `plyr` package has by now been replaced by other, even faster
packages, but the idea of *Split, apply, combine* is as relevant as
ever. Read the paper [The Split-Apply-Combine Strategy for Data
Analysis](https://www.jstatsoft.org/article/view/v040i01) by Hadley
Wickham. Write a blog post addressing the following questions:

1.  The R code for the split-apply-combine paper is posted with the
    paper. Pick one of the examples demonstrating `plyr` functionality
    (such as `dlply` or `ddply`, …) and rewrite the example using
    functionality from the package `dplyr`. Make sure that your example
    works and the results are identical.

I chose the 1st example on `baseball` dataframe where the author:

- **Split** the dataframe based on `id`
- **Apply** this calculation: `year - min(year)` and store in a new
  variable `cyear`. This step is done on each `id` group, which means
  the function `min(year)` applies to the years within each group only.
- **Combine** the calculated `cyear` from each observation of the
  dataframe to be a new corresponding column. The resulting dataframe
  has 21699 obs. of 23 variables.

``` r
library(plyr)
baseball1 <- ddply(baseball, .(id), transform, cyear = year - min(year) + 1)
head(baseball1)
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

Using `dplyr`, I re-wrote the code as followed:

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
baseball2 <- baseball%>%
  group_by(id)%>%
  mutate(cyear = year - min(year)+1)%>%
  arrange(id)
baseball2 <- as.data.frame(baseball2)
head(baseball2)
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

Here, **split** is done with `group_by`, then **apply** the same
procedure with `mutate` to create a new variable, and **combine** is
automatically followed. The resulting tibble `baseball2` is the same,
but I sorted the `id` alphabetically and converted it to dataframe to
match `baseball1`. One difference is the use of pipe `%>%` operator
instead of having all arguments inside the round brackets.

Personally, I prefer `dplyr` maybe because I have been using it more,
but also I find it hard to include all steps at once. The pipe operator
really helps to clarify things.

2.  Which (base R) functions do you know that support the
    split-apply-combine strategy? In your opinion, are these sufficient?
    State why or why not?

The family of `apply` functions also perform the split-apply-combine
strategy, but they have limitations (e.g., splitting based on MARGIN
(column/row) or INDEX (factor to split)). Similarly to `plyr`, these
`apply` variants also require users to pack all arguments inside the
brackets, making the code cluttered.

For the example above, I do not think that any form of `apply` could
**split** the dataframe based on `id` conveniently the way we wanted.
One inefficient approach is to get the splitting factor (**split**),
find the `min(year)` based on this split (**apply**), then create a new
variable as a new column to the dataframe (**combine**).

``` r
# Sort the ids to get splitting factor
baseball3 = baseball[order(baseball$id),]
all_id = table(baseball3$id)
sid = rep(1:length(all_id),times=all_id)
# tapply to find min(year) for each group
min_year <- tapply(baseball3$year, INDEX=sid, FUN=function(x) min(x))
# mapply to add new variable
baseball3$cyear<-mapply(function(x,y) x-y+1, baseball3$year, rep(min_year,times=all_id))
head(baseball3)
#>              id year stint team lg   g  ab   r   h X2b X3b hr rbi sb cs bb so
#> 37157 aaronha01 1954     1  ML1 NL 122 468  58 131  27   6 13  69  2  2 28 39
#> 37795 aaronha01 1955     1  ML1 NL 153 602 105 189  37   9 27 106  3  1 49 61
#> 38408 aaronha01 1956     1  ML1 NL 153 609 106 200  34  14 26  92  2  4 37 54
#> 39023 aaronha01 1957     1  ML1 NL 151 615 118 198  27   6 44 132  1  1 57 58
#> 39645 aaronha01 1958     1  ML1 NL 153 601 109 196  34   4 30  95  4  1 59 49
#> 40291 aaronha01 1959     1  ML1 NL 154 629 116 223  46   7 39 123  8  0 51 54
#>       ibb hbp sh sf gidp cyear
#> 37157  NA   3  6  4   13     1
#> 37795   5   3  7  4   20     2
#> 38408   6   2  5  7   21     3
#> 39023  15   0  0  3   13     4
#> 39645  16   1  0  3   21     5
#> 40291  17   4  0  9   19     6
```

I believe this code using `apply` could be shortened, but it still has
certain limitations on splitting only by MARGIN/INDEX. So, `dplyr` is
obviously more efficient and convenient.

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

I would correct some details as followed:

- Apply: A specific operation or function is applied to each group of
  data, **or applied to each element within a group (e.g.,one row in a
  dataframe, one element in a list)**.
- Combine: The results of the operation applied to each group are either
  combined to a simplified output or **returned/appended at the
  corresponding element in a group** usually for the purpose of
  aggregating, summarizing, or transforming the data within each group.
  For example, the `cyear` returned in Question 1 is not combined to a
  single output, but added as a new variable to each observation in the
  dataframe.
- The paradigm is commonly implemented using tools such as the “groupby”
  **and “apply”** function in the R and Python programming languages,
  and the “dplyr” library in R.
