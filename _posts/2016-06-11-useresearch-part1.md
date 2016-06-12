---
layout: post
title: useResearch - Usage Analytics for R Functions, Pt.1
tags: [R, useResearch]
---

![](/images/useRs.jpg)

<a class="github-button" href="https://github.com/data-steve/useResearch" data-icon="octicon-star" data-style="mega">useResearch</a>

This is the main part of the proposal [Tyler Rinker](www.github.com/trinker) and I submitted to the first ISC call for proposals by the R-Consortium. Our next post will describe [**useResearch**](https://github.com/data-steve/useResearch): the solution we ended up building, despite not getting funded. Some details of the how part of our proposal have evolved in our development of the package, so here we focus on the why part.

We proposed building a platform for R developers to get usage statistics and analytics on their packages at the function-level so that they can optimize their open-source contributions to how the R community is already using their work. 

Our idea is rather ambitious: create decentralized, open-source user research tooling for open-source languages themselves, not just the products those languages are used to create. Give languages the same attention that websites and products have had for years; give open-source developers and users the same feedback loop companies invest heavily to have. 

We don't know of any other attempt at doing this -- whether developer, package, or open-source language. We wanted to make sure to do it in a way that empowers developers to do their own usage analytics within their own functions instead of being dependent on IDEs to do log scraping for them. We also wanted to maintain the privacy of the user and leave the user's experience of R uncluttered. As with the history of open-source, this decision keeps decentralized developers and individual users at the center of maturing R's package ecosystem rather than products and companies. 

Though we did not get funded we still wanted to share the proposal and move forward on developing the idea. Again, next post will be more about the how of **useResearch**.


# Our proposal-- the why


**useResearch**: package for collecting function-level user research for the useR community


## Problem:

#### What:

User research (UR) is essential for product success. Many robust UR resources have become indispensable developer tools in industry. Although the open-source community often builds many of these tools, the open-source languages themselves often do not benefit from this same attention as the products they are used to build.

As with other open-source languages, R is not immune to this lack of UR attention. Good UR functionality could identify new opportunities to aid the development of R’s core needs. The R community has been through ~3 years of popular emphasis on writing performant code to compete with other packages or languages at doing the same functionality. R-dev tools like [microbenchmark](https://trinkerrstuff.wordpress.com/2012/04/28/microbenchmarking-with/), [profvis](https://twitter.com/sckottie/status/672843219114176513), and [Rcpp](http://www.r-bloggers.com/rcpp-now-used-by-over-500-cran-packages/) are at the center of the emphasis on performance, while packages like roxygen2, devtools, and packrat do similarly for package building and versioning.

useR groups and R-bloggers are invaluable tools and distinguish Rstats from other communities, but the average R user does not run a blog or have access to local or national meetups. Programmatic UR tools could give these users a voice. UR would allow users to regularly give feedback painlessly and allow R-devs to remove small-sample/selection biases from their feedback loops, thus enabling discovery of untapped demand or opportunities for synergistic functionality. Through better programmatic UR support valuable information would be more equally distributed among the R community.

The R Consortium knows UR functionality is key. At the 2015 EARL Boston Conference the R Consortium discussed its agenda. [One follow-up question, in particular, hit on the importance of having a feedback loop on R packages. All three responses from the 3 discussants suggested that the R Consortium considers UR a very high priority and getting feedback and collecting data from the community was essential.](http://www.scribblelive.com/Event/Live_from_EARL_Boston/201901662) Yet even the examples of useful statistics to collected listed by JJ Allaire in the quote from the above link -- these stats were at the package level (package updates, github stars, issue close rates), not on the session/function level where the user actually lives.

To our knowledge, R Foundation and CRAN currently do not collect UR data at the session/function level. A few CRAN mirrors have begun logging package downloads, but much more can be imagined for [R to compete with
proprietary languages](http://www.scribblelive.com/Event/Live_from_EARL_Boston/201898332). Like other companies, [RStudio collects extensive user statistics related to the use of their products and interaction with their website](https://www.rstudio.com/about/privacy-policy/).

#### Why:

As with any project, identifying where to allocate resources is a major challenge. In an open-source context, the imagination of the developer drives the project and defines resource allocation. [Many important packages are developed by unpaid individual contributors](http://www.scribblelive.com/Event/Live_from_EARL_Boston/201902795) and thus optimizing their investment is crucial, especially as R goes mainstream in industry. In early stages, these authors are likely motivated by a practical personal problem they are trying to solve or automating a method they learned about at school/ work. But moving beyond the initial inspiration of their own experience to develop for a wider audience can be daunting. Knowing what your audience wants/needs can help alleviate the search burden and focus their attention where their skills have already proven excellent. Additionally, UR reporting could help disseminate / highlight a nuanced agile view of development which seeks to make regular small, targeted improvement to a core set of functions. Thus, if a developer begins to realize that upgrading a few functions (instead of a whole package) can please most users, most of the time, it could substantially change the value proposition.

#### Who affected:

Directly it could affect every R developer and every R user.

#### What enabled:

Indeed, Github issues and StackOverflow questions can provide hints to where pain points are; and twitter, meetups and conferences can provide community expression. But if one wants to build for actual use instead of to silence (potentially) squeaky wheels, then more representative metrics at the function/session/user level are
needed. Data at the function/session/user level will enable much clearer evidence of ... dynamic ... language use...

## Plans:

**useResearch** proposes a way to handle the collection and sending steps of UR functionality in a decentralized way. Neither part requires a fundamental change to R-Core; and the solution complies with CRAN's policies. Nevertheless, this new UR functionality could empower developers in a fundamentally new way, changing how R evolves into the future.


**useResearch** puts developers in the driver's seat by both putting the onus on them to add UR functionality to their packages and allowing their UR data to remain private to them. Though the onus is theirs, **useResearch** still does for them all the heavylifting of packaging and enabling UR functionality. Similarly, **useRstats** enables some UR reporting functionality, but it’s developers who generate their own reports. While this method is the most dependent of the developer, these are the very users to desire and understand the power of the platform. It also allows specific functions identified by the developers' instincts to stay the focus of each wave of UR; similarly, given that the developer can deploy **useResearch** at will, they could adjust which of their functions or which of their packages has active UR enabled.

# Conclusion


To be clear, we believe **useResearch** would dramatically change who R packages get developed without needing to change the way users use the packages or how R core works. The UR enhanced pacakges could be deployed on both Github and CRAN. The philosophy and technical decisions we've made complying with the CRAN policies. The feedback that is collected could be done in a similarly discreet way as RStudio does, allowing minimal to no effort from the user and while maximizing developers potential to do great work in targeted ways. 

As with all of open-source, it is imperative that the developer work for the good of the community and the individual user; but we also think it is about time the community and the user give developers the tools to do so. To make that a reality, we've created **useResearch**.



<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats, OSS, opensource, userResearch" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/useResearch" data-icon="octicon-star" data-style="mega">useResearch</a>

<br><br>
