---
layout: post
title: 'R Posting Multiple Answers to Google Forms '
tags: [R, googleformr]
---

<a class="github-button" href="https://github.com/data-steve/googelformr" data-icon="octicon-star" data-style="mega">googelformr</a>

<div style="float:right; margin:10px;">
 <img src="/images/googleformr_logo.png" width="200">
</div>

In [previous posts](/googleformr-5min-howto) on [how to use](feedbackr-for-user-feedback) **googleformr**, I've always demonstrated the functionality on toy forms that had only one text box. User feedback from has suggested that functionality for posting answers to a form with multiple questions would be desirable. 

Happily, googleformr already has that capability. Using the `gformr` function we can create a function `post_answers` links to our form via the form url or form id. To get the most recent development copy of **googleformr**:

    pacman::p_load_current_gh("data-steve/googleformr")

A demostration showing how to do this is a good idea. We'll be posting a variety of example answers to this form here:

<div style="float:right;margin:5px -20px 5px 20px; max-width: 232px; max-height: 217px; ">

<img src="/images/testform_form.png"   width="232" height="217">

</div>


    form_id <- "11v2QeaQomevSyzBTHeIIK2uPJ2moby2IQT7jbk7UhgQ"
    post_answers <- googleformr::gformr(form_id)

For ease, I've did add a pretty printing function `get_form_str` to **googleformr** that makes it easier to see the form questions and entry ids side-by-side.


      get_form_str(form_id)
      
      	Order your post content
      	according to the Questions on Form
           entry.qs       entry.ids         
      [1,] "mc"           "entry.2006129165"
      [2,] "check"        "entry.872386724" 
      [3,] "short answer" "entry.1508946521"
      [4,] "paragraph"    "entry.1764754128"


Suppose we want to post the following content to our form. Here's two illustrative examples. 

    post_this <- c("I'm not a robot", "I'm a human", "anything", NA)
    dont_panic <- c("Paranoid Android", 42, "Meaning of life", NA)

To send this content we just 

    post_answers(post_content=post_this)
    post_answers(post_content=dont_panic)

We can see below the answers show up like this in the spreadsheet. 

![](/images/testform_entries.png)

But you can confirm a 200 http status by using `check_form_works()`, like so:

    post_answers(post_content=post_this) %>% check_form_works()

The `All good.` is the assurance.

### Two important caveats 

First, as long as the number of elements in the `post_content` vector match the number of `entry.ids` (or names) it has scraped from the page source, it should go through. If they aren't, it will error and you'll need to make sure there's equal length between post vector and entry.ids vector. 

Second, while Google Forms accepts the post no matter its content data types (assuming the caveat above regarding length of elements and names), it does require that certain question types receive only certain answers. For example, the multiple choice and checkbox answer types only accept answers that are one of the listed options as answers; otherwise it leaves those cells in the spreadsheet empty, as the `dont_panic` list values demonstrate. The `All good` will still show up in the console, even if the cell rejects the data. 

**googleformr** currently doesn't support error throwing for conflicts when a submitted answer isn't on the list of options. So its good to double check answers generally and spelling specifically. The error triggered is not from the data types of the content sent, since the function coerces everything to character anyway, but rather is triggered by the regex requirements placed on the content.

That's why it may be advisable to use the short answer and long answer text boxes when building your own forms to be used with `googleformr`; with these, we don't face the same restrictions observed above. As proof, we can even turn the `mtcars` dataframe into a json string and post it to the textbox. This is one way to pass dataframes around without worrying about structuring a form to adhere to specific database requirements.

    empty_cars <- c("", "", "", jsonlite::toJSON(mtcars) )
    post_answers(form=form_id, answers=empty_cars)
          
In the next post, I'll be showing how to use googleformr to create an automatic homework checker that gives programmatic feedback. 

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,gapi,datascience" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googelformr" data-icon="octicon-star" data-style="mega">googelformr</a>
