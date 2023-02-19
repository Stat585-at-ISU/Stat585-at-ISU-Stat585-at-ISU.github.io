dplyr vs plyr
================
Landon Getting
2023-02-16

<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
# loading in necessary libraries and data sets
library(plyr)
#> Warning: package 'plyr' was built under R version 4.2.2
library(dplyr)
#> Warning: package 'dplyr' was built under R version 4.1.3
data("baseball")
```

**Read the paper [The Split-Apply-Combine Strategy for Data
Analysis](https://www.jstatsoft.org/article/view/v040i01) by Hadley
Wickham.**

## Question 1 - dplyr and plyr

**The R code for the split-apply-combine paper is posted with the paper.
Pick one of the examples demonstrating `plyr` functionality (such as
`dlply` or `ddply`, …) and rewrite the example using functionality from
the package `dplyr`. Make sure that your example works and the results
are identical.**

In the baseball case study, Hadley first shows an example where we need
to create a new column called “cyear” which states how long the player
has been playing. Since each row represents a year, this calculation
needs to be preformed for every row. He starts by using Base R functions
to accomplish this operation for a single player.

``` r
baberuth <- subset(baseball, id == "ruthba01") # similiar to dplyr filter

baberuth <- transform(baberuth, 
                      cyear = year - min(year) + 1) # similiar to dplyr mutate

baberuth[,c("id","year","cyear","rbi")] # checking to see if it worked
#>             id year cyear rbi
#> 14646 ruthba01 1914     1   2
#> 15457 ruthba01 1915     2  21
#> 16238 ruthba01 1916     3  15
#> 16776 ruthba01 1917     4  12
#> 17286 ruthba01 1918     5  66
#> 17790 ruthba01 1919     6 114
#> 18329 ruthba01 1920     7 137
#> 18834 ruthba01 1921     8 171
#> 19363 ruthba01 1922     9  99
#> 19883 ruthba01 1923    10 131
#> 20420 ruthba01 1924    11 121
#> 20967 ruthba01 1925    12  66
#> 21507 ruthba01 1926    13 150
#> 22038 ruthba01 1927    14 164
#> 22572 ruthba01 1928    15 142
#> 23110 ruthba01 1929    16 154
#> 23656 ruthba01 1930    17 153
#> 24167 ruthba01 1931    18 163
#> 24694 ruthba01 1932    19 137
#> 25199 ruthba01 1933    20 103
#> 25702 ruthba01 1934    21  84
#> 26477 ruthba01 1935    22  12
```

Next, Hadley introduces ddply as a method to perform the calculation for
each of the players for each of the years they played.

``` r
# calculating how long every player has played using plyr
# dataframe to dataframe
baseball_plyr <- ddply(baseball, # dataframe
                  .(id), # split up by id
                  transform, 
                  cyear = year - min(year) + 1) # processing function

baseball_plyr[baseball_plyr$id == "ruthba01",
              c("id","year","cyear","rbi")] # checking to see if it worked
#>             id year cyear rbi
#> 17005 ruthba01 1914     1   2
#> 17006 ruthba01 1915     2  21
#> 17007 ruthba01 1916     3  15
#> 17008 ruthba01 1917     4  12
#> 17009 ruthba01 1918     5  66
#> 17010 ruthba01 1919     6 114
#> 17011 ruthba01 1920     7 137
#> 17012 ruthba01 1921     8 171
#> 17013 ruthba01 1922     9  99
#> 17014 ruthba01 1923    10 131
#> 17015 ruthba01 1924    11 121
#> 17016 ruthba01 1925    12  66
#> 17017 ruthba01 1926    13 150
#> 17018 ruthba01 1927    14 164
#> 17019 ruthba01 1928    15 142
#> 17020 ruthba01 1929    16 154
#> 17021 ruthba01 1930    17 153
#> 17022 ruthba01 1931    18 163
#> 17023 ruthba01 1932    19 137
#> 17024 ruthba01 1933    20 103
#> 17025 ruthba01 1934    21  84
#> 17026 ruthba01 1935    22  12
```

With dplyr, I can perform this operation with *mutate*. Looks like it
matches up with plyr!

``` r
# dplyr one less line than plyr!
baseball_dplyr <- mutate(baseball, # dataframe to use
                         cyear = year - min(year) + 1, # function to perform
                         .by = id) # split by id

baseball_dplyr[baseball_dplyr$id == "ruthba01",
              c("id","year","cyear","rbi")] # checking to see if it matches 
#>             id year cyear rbi
#> 14646 ruthba01 1914     1   2
#> 15457 ruthba01 1915     2  21
#> 16238 ruthba01 1916     3  15
#> 16776 ruthba01 1917     4  12
#> 17286 ruthba01 1918     5  66
#> 17790 ruthba01 1919     6 114
#> 18329 ruthba01 1920     7 137
#> 18834 ruthba01 1921     8 171
#> 19363 ruthba01 1922     9  99
#> 19883 ruthba01 1923    10 131
#> 20420 ruthba01 1924    11 121
#> 20967 ruthba01 1925    12  66
#> 21507 ruthba01 1926    13 150
#> 22038 ruthba01 1927    14 164
#> 22572 ruthba01 1928    15 142
#> 23110 ruthba01 1929    16 154
#> 23656 ruthba01 1930    17 153
#> 24167 ruthba01 1931    18 163
#> 24694 ruthba01 1932    19 137
#> 25199 ruthba01 1933    20 103
#> 25702 ruthba01 1934    21  84
#> 26477 ruthba01 1935    22  12
```

## Question 2 - split, apply, combine and Base R

**Which (base R) functions do you know that support the
split-apply-combine strategy? In your opinion, are these sufficient?
State why or why not?**

The only Base R functions that I am familiar with that support the
split-apply-combine strategy are *split()* and *lapply()*. Although I
initially thought these would be adequate, Hadley makes a great point on
page 4 of the paper when he discusses the lack of label continuity if
utilizing the Base R functions. As demonstrated on the previous
question, the plyr and dplyr functions are also nicely convenient and
reduce the number of unique function calls.

## Question 3 - What did ChatGPT miss?

**The ChatGPT response to the prompt “Describe the split-apply-combine
paradigm” is given below. Generally, the chatbot’s answers are decent.
ChatGPT does have problems getting details right. Which details would
you change in the response?**

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

ChatGPT’s definition of the *‘Split’* step is fairly short and suggests
splitting based on some variables. Although this is correct, I think
considering the split to be based on a *conditional* statement is more
intuitive. This includes cases where you may need to perform a
split-apply-combine (or other operations) just to create the variables
necessary for a more complex split.

In addition, Hadley brings up an important assumption in page 2 of the
paper that potentially should have been included in the closing
paragraph of ChatGPT’s response:

> *“Note that plyr makes the strong assumption that each piece of data
> will be processed only once and independently of all other pieces.
> This means that you can not use these tools when each iteration
> requires overlapping data (like a running mean), or it depends on the
> previous iteration (like in a dynamic simulation).”*

I think ChatGPT’s response may have been more robust if it included a
short sentence on the limits or downsides of the approach in contrast to
the efficiency and scaleability praise. However, it is amazing that it
can provide such a response in the first place!
