---
layout: post
title: googleformr on CRAN
tags: [R, googleformr]
---




As I said in [my last post](/googleformr-safe-easy-free/),

> **googleformr** came out of a persistent series of questions: How to
> collect data remotely? And do it programmatically with R? And safely,
> easily, and free?

Well, now [**googleformr** is up on
CRAN](https://cran.r-project.org/web/packages/googleformr/index.html).


#### Google Form niceties

After getting **googleformr** on CRAN, I had intended to extend
**googleformr** with some data visualization functionality in future
revisions; but upon consideration I’ve realized that Google Form has
some built in point-n-click summary tools that are quite robust.

<div style="float:left;margin:5px 20px 5px -20px; max-width: 232px; max-height: 217px; ">

<img src="/images/google_formr_img_drop_down.png"   width="232" height="217">

</div>
For example, if you simply go to your Google Form spreadsheet, you can
click the “Show summary of responses” on the Form drop-down tab, an html
report with text, timeline, and bar chart features.

Moreover, with [Google’s deployment of the Automatic
Statistician](https://gigaom.com/2014/12/02/google-is-funding-an-artificial-intelligence-for-data-science/)
in Spreadsheets, lower-level descriptive tasks are coming for free. So I
don’t feel the pressure to build out those features.


#### **googleformr** is an app 

One of the more interesting developments since releasing googleformr has
been the realization that it could help me solve other problems in ways
I hadn’t imagined before. So with those googleformr functionalities less
of an need because of what Google Forms offers out of the box, in the
near future I hope to focus more on expanding ways that googleformr can
be leveraged elsewhere.

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience, googleapps" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega" aria-label="Star data-steve/googleformr on GitHub">googleformr</a> 

