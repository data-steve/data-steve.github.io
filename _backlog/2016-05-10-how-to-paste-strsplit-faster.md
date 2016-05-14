---
layout: post
title: paste(strsplit()) and lists
tags: [R]
---

![](/images/strsplit.png)

At work, I discovered a new way `strsplit` behaves when you paste it together. Or maybe I should say how `paste` behaves differently depending on the data structure you pass it. It just so happens it likes the `strsplit` output just fine.

`strsplit`'s output is a list. In a simple case where you want to split the string `"x,y,z"` on the commas, it will produce the a list containing a vector of the split letters, like so:

    strsplit("x,y,z", ",")
    [[1]]
    [1] "x" "y" "z"
  
So I've always subsetted the output of strsplit with `[[1]]` to get the vector in the list, like so:

    strsplit("x,y,z", ",")[[1]]
    [1] "x" "y" "z"

So when I had a task where I wanted to take the string of letters `"x,y,z"` and transform it into a vector of letters `c("x", "y", "z")` so I could use it to paste together the parts of a function, I thought I'd have to concantenate each part together, like so:

    ex1 <- paste0("c("                      # get the c(
            , paste(
              shQuote(                      # get the quotes around letters
              strsplit( y, ",")[[1]]        # split string on ","
                    )
                    , collapse=", ")        # repaste quoted letters together
                    ,")")


Instead by not using the subsetting with `[[1]]`, I got to save 3 function calls and ended up with output with the same essential behavior: 

    ex2 <- paste0(strsplit( y, ","))
    
Comparing the output, you can see they are the same:

    cat(ex1, ex2)
    # c('x', 'y', 'z') c("x", "y", "z")
        
At first I had misgivings until I just constructed my own list examples:

    v1 <- list("a","b","c")
    v2 <- list(c("1","2","3"))      # same structure as strsplit
    v3 <- list(1:3)

    paste(v1); paste(v2); paste(v3)
    
These lists have very different structures:

    str(v1);str(v2);str(v3)
    # List of 3
    #  $ : chr "a"
    #  $ : chr "b"
    #  $ : chr "c"
    # List of 1
    #  $ : chr [1:3] "1" "2" "3"


x<-list(1:3)
paste(as.expression(x))

x<-list(c('1', '2', '3'))
paste(as.expression(x))
as.character(as.expression(x))


And only the second returns a vector of characters when `cat`-ed

Since we were using this `strsplit` code in an `ifelse` vectorized function on fairly tall data, it saved us noticable compute time. So I thought I'd share the insights.

