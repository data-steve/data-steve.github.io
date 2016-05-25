---
layout: post
title: Setting Up New R Notebook
tags: [R ]
---

<img src="/images/new_rmarkdown.gif" width="600">

Today Noam Ross' tweet about his experience with the new R Notebooks from RStudio got me excited.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Can not find a GIF to properly convey the joy + wreckage of me messing around with the internals of the new <a href="https://twitter.com/hashtag/rstats?src=hash">#rstats</a> notebook stuff.</p>&mdash; Noam Ross (@noamross) <a href="https://twitter.com/noamross/status/734896129935036417">May 23, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Couple that with the release of JJ Allaire's video at Open Data Science conference and I was eager to find it. In case you're eager to trial it too, follow the steps below.

<iframe height="160" src="https://www.youtube.com/embed/zNzZ1PfUDNk" frameborder="0" allowfullscreen></iframe>


<br>
<br>


#### Steps:

1.) [Download latest RStudio daily](https://www.rstudio.org/download/daily/desktop/) for RStudio IDE and update: 

2.) Download latest Rmarkdown package: `devtools::install_github("rstudio/rmarkdown")`

3.) Set your Options: Tools > Global Options > Rmarkdown > Enable R Notebook > Apply

![](/images/set_Rnotebook_options.png)

4.) Open a new Rmarkdown file as usual

5.) Set the YAML output options from `output: html_document` to `output: html_notebook: default` 

Don't forget that with the new daily build of RStudio you can pull the Rmd file out of the RStudio IDE and edit it in a separate pane. Simply grab the document tab and pull it away, as you would tabs in your browser or Sublime. 

