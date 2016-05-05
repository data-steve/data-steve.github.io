---
layout: post
title: Need user feedback? Send it directly from R
tags: [R, googleformr, useResearch ]
---

![](/images/phone_string.png)
<a href='https://upload.wikimedia.org/wikipedia/commons/5/53/Tel%C3%A9fono_de_cordel_(1882).jpg'>Modified from Wikimedia</a>

#### Help Me, Help You

As an R-dev, I'd like to know I'm meeting community need, as well as my own. But after an initial "aha!" moment, you don't always know how to live up to the full potential of what you've started with a package. [Even our beloved RStudio collects extensive data through their product to better understand how to build out the platform and offer other services.](https://www.rstudio.com/about/privacy-policy/)

So it'd be nice to programmatically allow meaningful user feedback to be easily sent to me privately without a lot of hassle 

googleformr now comes with the function `gformr_comments` function that allows any useR of googleformr to send **useful, helpful, kind** comments to a Google Form I have set up for this purpose. Just follow along below:


    # compose a thoughtful comment and save it to a variable
    my_comment <- "I'd love a googleformr feature to help distinguish 
    			   between lots of posts for one person vs. 
    			   lots of posts from many people."
    
    # then send the comment
    googleformr::gformr_comment(my_comment)


<iframe src="//giphy.com/embed/5xtDarnvDIBBEr972uY" width="480" height="288" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="http://giphy.com/gifs/help-me-you-jerry-macguire-5xtDarnvDIBBEr972uY">via GIPHY</a></p>

#### useR feedback

Generally, I think this could be a useful feature for many R-devs who'd like to be accessible to those users. 

Most users:

- don't run their own blogs,
- don't attend useR groups, and
- don't have a Github account to post issues.

And really, is an Issue post a place for saying "well done", or for is asking for a feature? Or even, [as a newbie,is an Issue such a small thing to do?](thttp://www.codenewbie.org/blogs/how-to-make-a-pull-request). 

I'd love 100 notes telling me they'd like a googleformr feature to help distinguish between lots of posts for one person vs. lots of posts from many people. But I wouldn't want to have to close out 100 Issues on Github saying the same thing. 

In my next post, I'll give a short tutorial for adding a feedback function to your package as well.






<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,googleapps," data-dnt="true">Tweet</a>