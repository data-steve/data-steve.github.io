---
layout: post
title: googleformr updates on CRAN
tags: [R, googleformr ]
---



Main updates to **googleformr** have been to remove an internal dependency on magrittr chains in the function construction and to take http status checking outside of the main `gformr` function and into a `check_form_works` function. Both changes provide notable speed gains.

<div style="float:right; margin:10px;">
 <img src="/images/googleformr_logo.png" width="200">
</div>
One can still create a function with `gformr` as before:

    pacman::p_load(googleformr)
    form <- "your_google_form_url"
    my_fun <- gformr(form
                     , custom_reply = "my reply")
                                  
And then you can test that it works by:

- sending a test message to your Google Form and see if it shows up and/or
- using the `check_form_works` function like so: `check_form_works( my_fun("test") )`. 
  
Either "All good" will appear in the console or a specific http status message describing the error.
    
As before, users of your function can post content back to your form via code like below:
    
    my_fun(post_content)

In addition to speed gains, taking http status checking outside `gformr` also the benefits of conforming better to good design principles such as of separation of concerns and DRY: the developer is the one who needs to status checking. But this is only once and at development time; the useRs repeated experience of the function afterwards is the custom reply option the developer chooses, if at all. 

Over the next two weeks, a series of blog posts will lay out ways in which googleformr as an API has been used for general purpose data science tasks around the office and for package development. 


<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script> <a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience, googleapps" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega" aria-label="Star data-steve/googleformr on GitHub">googleformr</a> 
<script async defer id="github-bjs" src="https://buttons.github.io/buttons.js"></script>