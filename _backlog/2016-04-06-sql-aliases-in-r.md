---
layout: post
title: SQL Aliases in R
tags: [SQL, R, dplyr ]
---


# curl::curl_download("https://github.com/yoni/r_we_the_people/blob/master/data/petition_analyses.RData?raw=true", destfile="~/Desktop/pet.RData")
# this behaved much better than download.file() for me
# load("~/Desktop/petition_analyses.RData")


# this keeps things simple
# it's like the SQL behavior of giving object with long names an alias
# http://r.789695.n4.nabble.com/renaming-objects-td851715.html#a851716
makeActiveBinding("p", function(){petition_analyses}, .GlobalEnv)

https://github.com/hadley/dplyr/issues/1759

