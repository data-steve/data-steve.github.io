---
layout: post
title: feedbackr <- R-devs + useRs
tags: [R, googleformr, feedbackr, useResearch ]
---

![](/images/phone_string.png)
<a href='https://upload.wikimedia.org/wikipedia/commons/5/53/Tel%C3%A9fono_de_cordel_(1882).jpg'>Modified from Wikimedia</a>

In my last post I explained why I added a feedback function to googleformr. Since googleformr is an API for collecting data programmatically, I figured I leverage it for package development and accessibility.

Below I'll show how you can do the same for your package.

Create your own comment function
=============


You can create your own `comments_pkg_name` function by linking it to a Google Form using 
something along the lines of the code below: 


      # create function
      form <- "your_google_form_url"
      comments_pkg_name <- googleformr::gformr(form
                                               , custom_reply = "Thanks for supporting pkg_name")
      

**Note: it is recommended to call your  comments function some clearly signalling  a comment purpose but also something specific to your package.**
So a function name following the pattern `comments_pkg_name` should get the best of easy
IntelliSense auto-complete and distinguishability from other packages using the same 
functionality


Once you rebuild your package and post it to github or CRAN, your useRs
can send comments directly to you from the R console by simply 
putting their comments into your comments function.

      comments_pkg_name("useR comments")



Helper Functionality
====================

You can test that your new `comments_pkg_name` function works by:

- sending a test message to your Google Form and see if it shows up and/or
- using the `check_form_works` function like so: `check_form_works( comments_pkg_name("test") )`. Either "All good" will appear or a specific http status message describing the error.


You can also extract Google Form question text or entry points using to make sure you can bring back the same information as is on your form:

```r
# questions
form <- "your_google_form_url"
form %>% get_form() %>% get_form_questions()

# entry ids
form %>% get_form() %>% get_form_entry_ids()
```