---
layout: post
title: Let pacman Eat Up library and require
tags: [R, pacman, useR, Rdev]
---

![](/images/2000px-Pac_Man-edit.png)

One of the packages I use all the time now in my interactive R sessions is [pacman](https://cran.r-project.org/web/packages/pacman/index.html). It's more than just a nicer way to load packages, it's a great way to explore packages, functions, package libraries, versioning, etc. 

Grab it off cran with `install.packages("pacman")`.

Out of the box, the function I use every day in all my scripts or at the console is `pacman::p_load()`; it's a great substite for `library()` or `require()`. Yihui has already written about his preferences/understanding on the [library vs. require](http://yihui.name/en/2014/07/library-vs-require/).

I prefer `pacman::p_load()` for different reasons than he describes. Instead of having to write 5 lines of code to load for 5 common data munging packages, like so: 

    library(dplyr)
    library(tidyr)
    library(plyr) 
    library(magrittr)
    library(ggplot2)
    
Rather, you can write one line 

	pacman::p_load(dplyr,tidyr,plyr,ggplot2, magrittr)

If you want to unload a packages, say to update it, the function `pacman::p_unload()` is pretty useful. Even better `pacman::p_load()` will install and load new packages. And for github or bitbucket accounts, use `pacman::p_load_gh()`. 

 > Yes, I know that if brevity in syntax for package loading were my main motivation, I could just do `import pandas` for python or `library(data.table)` in R and get the equivalent functionality in one package load; but brevity of package loading isn't my main concern in language or package choosing. 
    
Something else that's really nice is a way to print all the functions available in a package. Try it with `pacman::p_funs(magrittr)`. You may find it overwhelming for a large packages like `pacman::p_funs(stats)`; but I still like it in cases when IntelliSense auto-complete doesn't quite get me to the function I'm looking for or is cramped for reading.

Also, whenever you're doing a update to R or you just want to quickly back up all your packages to list I find `pacman::p_lib()` support helpful. For example,

    writeLines(pacman::p_lib(), "~/Desktop/list_of_R_packages.csv")


Lastly, to find out what the path to your R-library, the function `pacman::p_path()` is a real help. Check out the [pacman github page](https://github.com/trinker/pacman) for some more details.

In the next blog post, we'll have a bit of fun with 

![](http://fontmeme.com/freefonts/img.php?f=102&s=55&t=R-PKG%20%0Aeaster%20eggs&c=d03e19)