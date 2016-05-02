---
layout: post
title: R pkg Easter Eggs -- Revenge of Pacman!
tags: [R, pacman, useR, Rdev]
---


![](/images/pacman.png)


In my [last post](/let-pacman-eat-up-library-and-require/), I praised the virtues of pacman. I also wanted to indulge of one of the main benefits of working with one of pacman's devs: [Tyler Rinker](https://github.com/trinker).

Tyler is a geek's geek, in the best possible way. And one of the best officemates one could ask for to boot! As evidence of that, I thought I'd share a bit of the R-dev goodness that Tyler infused into his pacman package. The fun is a sign of the quality.

Test out this bit of code to find one of the coolest easter eggs in R language.

    if (!require("pacman")) install.packages("pacman")
    pacman::p_exists(R)


There are several other easter eggs in R listed on [Inside-r.org](http://www.inside-r.org/questions/are-there-any-easter-eggs-base-r-or-major-packages); a few are copied below for your fun:



    # install and/or load dependencies for the easter eggs
    pacman::p_load(animation, rgdal, PBSmodelling, onion, mapview)


#### Easter Eggs in Help Pages

A funny note about the locatoin data quality pops up in this help page and gives some pretty good advice regarding air travel.

    ?rgdal::project

Fair warning regarding the dangers of playing with internals.

    ?.Internal


#### Console Easter Eggs

These are a bit of wRy console humor:

  
    ????t.test
    
    example(readline)  # type n as input



#### Another easter egg viz, of sorts

    local(envir=.PBSmodEnv,expr={
      oldpar = par(no.readonly=TRUE)
      x=rnorm(5000,10,3); y=-x+rnorm(5000,1,4); z=x+rnorm(5000,1,3)
      A=data.frame(x=x,y=y,z=z)
      for (i in 1:3)
        switch(i,
               {plotFriedEggs(A,eggs=TRUE,rings=FALSE);
                 pause("Here are the eggs...(Press Enter for next)")},
               {plotFriedEggs(A,eggs=FALSE,rings=TRUE);
                 pause("Here are the rings...(Press Enter for next)")},
               {plotFriedEggs(A,eggs=FALSE,rings=FALSE);
                 cat("Here is the pepper alone.\n")} )
      par(oldpar)
    })
    
    
    data(bunny); p3d(bunny,theta=3,phi=104,box=FALSE)
    
    mapview()

> masthead image altered from screenshot of [original pacman imulator](http://pacman.shaunew.com/play/) 

<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script> <a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience" data-dnt="true">Tweet</a>
