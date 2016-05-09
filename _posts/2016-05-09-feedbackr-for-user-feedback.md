---
layout: post
title: feedbackr, R-devs  + useRs
tags: [R, googleformr, useResearch ]
---

![](/images/phone_string.png)
<a href='https://upload.wikimedia.org/wikipedia/commons/5/53/Tel%C3%A9fono_de_cordel_(1882).jpg'>from Wikimedia</a>

In [my last post](/need-user-feedback-send-programmatically) I explained why I added a feedback function to googleformr. Since googleformr is an API for collecting data programmatically, I figured I'd leverage it for package development and accessibility. Below I'll show how you can add your own feedback function to your package. 


Create your own feedback function
=============

First, make sure to grab **googleformr** from CRAN, if you haven't yet. [I love **pacman** as my library / function handler](/let-pacman-eat-up-library-and-require/). The `p_load` will load a library. If it isn't installed, it will install from CRAN and then load it.

      if (!require("pacman")) install.packages("pacman")
      pacman::p_load(googleformr)


You can create your own `feedback_pkg_name` function by linking it to a Google Form. Get your forms started at the [Google Forms page](https://www.google.com/forms/about/).  Once you have a google form created with one short answer question, grab the form's url and use code below: 


      # create function
      form <- "your_google_form_url"
      feedback_pkg_name <- gformr(form
                                  , custom_reply = "Thanks for supporting pkg_name")
      

Note: it is recommended to call your feedback function 

- something clearly signalling  a feedback purpose 
- but also something specific to your package.

So a function name following the pattern `feedback_pkg_name` should get the best of easy IntelliSense auto-complete and distinguishability from other packages using the same functionality.

Once you re-document and re-build your package and post it to github or CRAN, your users can send feedback directly to you from the R console by simply  putting their feedback into your feedback function.

      fdbk <-  # their comments
      feedback_pkg_name(fdbk)



Helper Functionality
====================

You can test that your new `feedback_pkg_name` function works by:

- sending a test message to your Google Form and see if it shows up and/or
- using the `check_form_works` function like so: `check_form_works( comments_pkg_name("test") )`. Either "All good" will appear or a specific http status message describing the error.


You can also extract Google Form question text or entry points using to make sure you can bring back the same information as is on your form:


	# questions
	form <- "your_google_form_url"
	form %>% get_form() %>% get_form_questions()

	# entry ids
	form %>% get_form() %>% get_form_entry_ids()

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,googleapps," data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega" aria-label="Star data-steve/googleformr on GitHub">googleformr</a> 
<br><br>
