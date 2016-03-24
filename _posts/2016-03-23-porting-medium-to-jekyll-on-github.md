---
layout: post
title: 'Porting Medium to Jekyll Github.io with R'
tags: [GITHUB, JEKYLL, R]
---

[this transition post is a copy from my Medium account for your comparison.]


I’m porting [my Medium blog](http://medium.com/@data_steve) to host on Github using Jekyll at
[data-steve.github.io](http://data-steve.github.io). I decided to do it
with code and make a package out of it in case others might want to.


#### Reasons 

Only after setting up the Medium blog did I realize that it doesn't meet [R-bloggers](http://www.r-bloggers.com/) needs for syndication, since Medium will only share an excerpt of
the post with a link to the rest. R-bloggers wants the whole post. Seems fair.

It's extra work to port over from Medium, but I like the idea of being able to work within my own
development environment. And instead of having to learn a bunch of
keyboard shortcuts for adding code and links, as I did for Medium, I can write code and execute commands and push updates via Jekyll and RStudio or SublimeText, for example.

#### Example 

Since I’m bothering to post this on Medium, I thought I’d get some use
out of it. I’ll show how I did it as a post on my new blog.

Here’s a code chunk to round out my porting example

``` 
# test code
nothing_special <- function(a){
    return(a)
}
```

Here’s a screenshot of a random bit of the code from the R package I’m
writing to show how the images are handled.


![](/images/1*RDkVpxPfCqDY8YrRVUtSxA.png)



See you over at [data-steve.github.io](http://data-steve.github.io).  There's I'll document and share the R code I used to transition my Medium content over.


