---
layout: post
title: googleformr asks - why R u open-source?
tags: [R, Data Science, Open Source]
---


<div  style="max-width: 1020px; max-height: 707px; padding-bottom: 1.8%;">



<img src="/images/google_form_survey.png"   width="1020" height="707">

</div>

[googleformr](https://cran.r-project.org/web/packages/googleformr/index.html) is a CRAN
package for collecting data programmatically via Google Forms.

For collecting data online through user submissions, Google Forms can be a very convenient way to maintain a lot of control. Trying to use Google Sheets or public folders on Dropbox either requires maintain a lot of credentialling, sharing your keys, or giving users direct access to the data you're collecting.  I put this package together to put that convenience and power in reach of R. 

As an illustration of how easy and useful googleformr can be, I thought there'd be no better way than to actually do something fun and useful for the open source/ R / data science communities? 

#### The Project 

For this project, I’ve created [a special Google
Form](https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform)
to collect data on why you are open source. Go have a look to see that it's just an average Google Form that anyone can create with their own google account.

I’ve used googleformr to build a demo function
called **why\_R\_u\_opensource**, which posts whatever data I give it to
my form. It comes with the latest dev version of googleformr package at my [github account](https://github.com/data-steve/googleformr).

To test out googleformr, send in your reasons for using open source via the code below.

```
devtools::install_github("data-steve/googleformr")
googleformr::why_R_u_opensource("") # <- your answer goes in quotes
```

#### How it works 

The code below was used at build time to make this
**why\_R\_u\_opensource** function as a demostration of how easy it is to
use the googleformr package.

``` 
# my form
form <- “https://docs.google.com/forms/d/1Ttl_SGI1cjRHSw_oU7kwxnGESoMwf4BU4NMAqPA-BRs/viewform"
```

``` 
# my new function linked to my form
why_R_u_opensource <- gformr(form,
                          custom_reply= “Thanks for opening up!”)
```

To send data just put in inside your new function, like so:

``` 
# my data going to my form using my function
why_R_u_opensource(“the R / open-source community is so helpful.”)
```

``` 
# the response I get from why_R_u_opensource
Thanks for opening up!
```

The confirmation response can be customized to whatever you want when
you build your own function. By default they are silent, so as to not be intrusive.

#### The Plan 

If there's enough response to justify it, I plan to post some summaries on what is sent in. Should be cool.


<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script> <a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega" aria-label="Star data-steve/googleformr on GitHub">googleformr</a> 
<script async defer id="github-bjs" src="https://buttons.github.io/buttons.js"></script>