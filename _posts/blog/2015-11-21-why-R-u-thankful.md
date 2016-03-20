---
layout: post
title: why R u thankful?
---



[googleformr](https://github.com/data-steve/googleformr) is a github
package for collecting data programmatically via Google Forms.

To my thinking, Google Forms are more convenient and give more control
than trying to use Google Sheets or public folders on Dropbox. So, I put
this package together. More on that later.

<div  style="max-width: 1020px; max-height: 707px; padding-bottom: 1.8%;">



<img src="/images/google_forms.png"   width="1020" height="707">

</div>


But for now, why not put it to use for the open source/ R / data science
communities just in time for Thanksgiving? Why not do as many
Thanksgiving traditions at once: celebrate, appreciate, and share?

#### The Project 

For this project, I’ve created [a special Google
Form](https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform)
to collect data on why you are thankful, especially as relates to open
source, R, data science…. I’ve used my package to build a function
called **why\_R\_u\_thankful**, which posts whatever data I give it to
my form. It comes with the googleformr package.

To test out googleformr, send me your thanksgiving using the code below.

```
if (!require(“pacman”)) install.packages(“pacman”)
pacman::p_load_gh(“steventsimpson/googleformr”)
```

```
googleformr::why_R_u_thankful("") # <- your answer goes in quotes
```

#### How it works 

The code below was used at build time to make this
**why\_R\_u\_thankful** function as a demostration of how easy it is to
use the googleformr package.

``` 
# my form
form <- “https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform"
```

``` 
# my new function linked to my form
why_R_u_thankful <- gformr(form,
                          custom_reply= “Thanks for Giving Thanks!”)
```

To send data just put in inside your new function, like so:

``` 
# my data going to my form using my function
why_R_u_thankful(“the R / open-source community.”)
```

``` 
# the response I get from why_R_u_thankful
Thanks for Giving Thanks!
```

The confirmation response can be customized to whatever you want when
you build your own function links to your Google Forms. By default they
are silent.

#### The Plan 

I plan to post later some summaries on what is sent in. I can’t wait to
share.

There’s much to be thankful for about R and open source. The posting
don’t have to stop after Thanksgiving, but I’m glad for the seasonal
impetus to start.