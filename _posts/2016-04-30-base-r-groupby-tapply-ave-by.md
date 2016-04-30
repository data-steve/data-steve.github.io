---
layout: post
title: Base R Nostalgia -- by, tapply, ave, ...
tags: [R]
---

![](/images/memory_lane.jpg)

<a href='https://www.flickr.com/photos/38302410@N04/3522676990'>photo credit: Paul Yoakum</a>

This evening I was feeling nostalgic for base R group-bys. Before there was `dplyr`, there was `apply` and its cousins. I thought it'd be nice to get out the ol' photo-album. 

To start off, the base R proto-ancestor of `magrittr` piping for me was the `with` function, especially with `apply`. It just cleaned up the
syntax and visual appearance of the code by pulling out the redundancy of declaring the data.frame. So even though it isn't necessary to use `with` for the
functions below, I think it makes things easier on the eyes and brain.


#### Aggregate Group-Bys

In terms of exploratory analysis, base R's equivalents to `dplyr::summarize` are `by` and `tapply`. In the case below for both `tapply` and `by` you have some a factor variable `cyl` for which you want to execute a function `mean` over the corresponding cases in vector of numbers `mpg`. So since `mtcars` cylinder variable `cyl` has 3 levels (4, 6, 8), we take the average miles-per-gallon for cars grouped by each of those cylinder categories. 

    with(mtcars, by(mpg, cyl, mean))
    cyl: 4
    [1] 26.66364
    ------------------------------------------------------------------------------------- 
    cyl: 6
    [1] 19.74286
    ------------------------------------------------------------------------------------- 
    cyl: 8
    [1] 15.1
    
    
    with(mtcars, tapply(mpg, cyl, mean))
           4        6        8 
    26.66364 19.74286 15.10000 


We can even get a similar behavior out of `sapply` by adding `split` to the mix. Since `sapply` doesn't natively have a way to handle the grouped aspects of the calculation, we use the function `split` to break up `mpg` into the 3 groups first, like so: 

    $`4`
    [1] 22.8 24.4 22.8 32.4 30.4 33.9 21.5 27.3 26.0 30.4 21.4

    $`6`
    [1] 21.0 21.0 21.4 18.1 19.2 17.8 19.7

    $`8`
    [1] 18.7 14.3 16.4 17.3 15.2 10.4 10.4 14.7 15.5 15.2 13.3 19.2 15.8 15.0


Using `split` returns a ragged list of 3 groups which `sapply` handles nicely:
    
    with(mtcars, sapply(split(mpg, cyl), mean))
           4        6        8 
    26.66364 19.74286 15.10000 


I was delighted to see I could hack out the same output using 2 `xtabs` (sum/n):

    with(mtcars, xtabs(mpg ~ cyl) / xtabs(~ cyl))     
    cyl
           4        6        8 
    26.66364 19.74286 15.10000 


`tapply` is the most compact for my taste, both in terms of code and output; but I must confess `by` does the vertically stacked display of output I got initially used to from my earliest exposures with SPSS and Stata. We can get that and a data frame to boot from `aggregate`, as long as we pass in our group variable as a list:

    with(mtcars, aggregate(mpg, list(cyl), mean))
      Group.1        x
    1       4 26.66364
    2       6 19.74286
    3       8 15.10000

And this brings us back to `dplyr` with its dataframe output:

    library(dplyr)
    mtcars %>% group_by(cyl) %>% summarize(mean(mpg))
    Source: local data frame [3 x 2]
        cyl mean(mpg)
      (dbl)     (dbl)
    1     4  26.66364
    2     6  19.74286
    3     8  15.10000



#### Non-Aggregate Group-Bys

If `tapply` resembles `dplyr`'s `group_by() %>% summarize()`, then `ave` somewhat resembles `dplyr`'s `group_by() %>% mutate()`. `ave`'s syntax works just like `tapply`'s, though their outputs differ notably. Unlike `tapply`, `ave` returns a single vector answer of the same length of the data passed in. 

    with(mtcars, ave(mpg, cyl, FUN=mean))
    [1] 19.74 19.74 26.66 19.74 15.10 19.74 15.10 26.66 26.66
    [10] 19.74 19.74 15.10 15.10 15.10 15.10 15.10 15.10 26.66
    [19] 26.66 26.66 26.66 15.10 15.10 15.10 15.10 26.66 26.66
    [28] 26.66 15.10 19.74 15.10 26.66


This is because if `tapply` is for summarizing the data, then `ave` is for prepping those data for assignment `<-` back into the parent data.frame, as with `mutate`. 
  
    
    mtcars %>% group_by(cyl) %>% mutate(mean(mpg))

And again, with some cleverness we can get `sapply` return the same result as `ave`; this time passing in the levels of `cyl` to subset `mpg` and take its mean.

    with(mtcars, sapply(cyl, function(x) mean(mpg[cyl==x])))


If you want to get `dplyr` to have somewhat similar behavior as `ave`, returning only the variables at play, use `transmute` instead of `mutate`. `mutate` returns the whole data.frame with the new variable included; `transmute` returns only the variables called or created in the code chunk.
    
    mtcars %>% group_by(cyl) %>% transmute(mean(mpg))    
    