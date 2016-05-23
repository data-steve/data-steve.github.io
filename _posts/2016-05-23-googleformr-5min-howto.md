---
layout: post
title: 5-min How-to on New Google Forms
tags: [R, googleformr]
---

<img src="/images/googleformr_logo.png" width="200px" style="float:right; margin:10px;"/>

**googleformr** is an API to Google Forms, allowing users to POST data securely to Google Forms without needing authentication or permissioning. Google Forms is a robust tool for collecting, analyzing, and storing data gathered through a webform on Google Drive. 

Since **googleformr** was created, Google Form has updated its user-experience of the Forms created process. It used to be that new forms could be created and a corresponding Google Sheet was created to store the data. Now under Google Forms 2.0, the data is experience through the Forms user interface as a second tab called Responses. The data collected by the form is only viewed to those with editing privileges. 

For many purposes of googleformr, there's no need to even download the data from Google Forms and thus, no need to have the data stored in a Google Sheet automatically, which I assume is why Google chose to remove that automatic step.

However, there are plenty of uses where it'd still be nice to have the data in a spreadsheet. In addition, [Google Sheets has really robust analysis tools in it already](/googleformr-on-CRAN/). But additionally, downloading the data is pretty easy given the awesome **googlesheets** package.


## 5-min How-To

#### Step 1: Get googleformr

Getting googleformr is simple.  This simple chunk should have you up and running with lickety split:


	if (!require("pacman")) install.packages("pacman")
	pacman::p_load_gh("data-steve/googleformr")


#### Step 2: Make a Google Form

Then make a Google Form with a text entry.  Here’s an image showing the steps to link the form to a spreadsheet. 

![](/images/new_forms_how_to.png)

In the Google Form edit: 

1. Click Responses tab 
2. Click those three dot thing-ies 
3. Click “Select response destination” 
4. click “Create a new spreadsheet”  

Step 1 done.  Almost there… In this image we see the Google Form and the accompanying Google Sheet.

![](/images/form_spreadsheet.png)


#### Step 3: Send Information Via googleformr

Just use the gformr function, add the Google Form url (from Step 1) and viola you have  a function that allows you to send information to a Google Form (in this case I made a pingfunction).  This is the function we can use to send information about the package and script usage within our company.


	ping <- googleformr::gformr('https://docs.google.com/forms/d/1sLh9CBW7RuzShqnbt260Ud85I_I2qQEdw_S6iMytJx4')
	ping('employee1234')


You’re in business with a secure way to send data from R to Google Spreadsheet.
Go ahead try it.  Replace ’employee1234′ with whatever you want, go to the Google Sheet, and watch the R code you send auto-magically be sent to the spreadsheet. I’ve made this sheet public for demonstration purposes, but generally it’s recommended that you keep the sheets private.

With this simple code snippet placed in the R scripts of our internal packages we were able to determine what packages and scripts were used, by whom, and how frequently.  So far our pneumatic road tube code  has provided insight into what tools to improve and new features to consider.  And it only took 5 minutes to set up end to end.

[revised from trinker's helpful post](https://trinkerrstuff.wordpress.com/2016/05/12/googleformr-at-work-pneumatic-road-tube-allegory/)




<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience, googleapps" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega" aria-label="Star data-steve/googleformr on GitHub">googleformr</a> 
<script async defer id="github-bjs" src="https://buttons.github.io/buttons.js"></script>
