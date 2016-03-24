---
layout: post
title: R and Python Choices
tags: [R, PYTHON, "Data Science"]
---

#### Of Platforms, Learning, and Packages

[In the first
post](https://medium.com/@DataScience_CampusLabs/nlp-on-commencement-addresses-using-r-and-python-336964670804)we
laid out our game plan for this blog series on analyzing text and web
data from NPR’s web-app collection of commencement addresses. It’s a fun
side project.

#### Python & R 

We’re not trying to add to the “Python vs. R” debate, which is (… like …
so… totally 2013) unproductive. Increasingly, it will be R and Python
and SQL and JavaScript and C++ and ….

But we must admit, although we both were woo-ed to open-source by R’s
breadth of packages and CRAN and wow-ed by RStudio’s IDE, I'm doing 
more and more things in Python. 

My first reluctance back in 2008 with Python was that it didn't seem
like getting packages/modules into it was very easy, nor did it seem easy to 
verify upfront that the modules would be stable. Nor was there a data.frame way 
of thinking in Python back then.  But now with Conda having figured out
python package management and with Pandas having come around, those barriers are no 
longer valid. Indeed, one might say Pandas pretty much put R at deficit until dplyr came around.


#### Learning a Language

Aside from the language features above related to managing add-ons and working with common
data structures like dataframes, Learning about a langauge and engaging its community are pretty different 
in terms of quality of opportunities between R and Python. 

On Python's side, it's got big conferences like
[PyCon](https://www.youtube.com/channel/UCgxzjK6GuOHVKR_08TT4hJQ) and
[PyData](https://www.youtube.com/user/PyDataTV), which put their 3-hr tutorials
on YouTube for free.  You’d think R’s useR! conferences would follow
suit, but they haven’t really done much to my knowledge. Thankfully, groups like the
[DataScience.LA](http://datascience.la) took some great hosting initiatives 
for useR!2014 with their interview
series and the [NYC R Conference](http://www.rstats.nyc/) did post some
interesting videos on applications of R in NYC shops. Despite these
efforts from the periphery, long-form video tutorials are really lacking for R.

MOOCs like Udacity and Udemy have considerably more/better
material for Python over R, but then Coursera's Data Science Toolkit has really brought
R into focus. [Data Camp's](https://www.datacamp.com/) leadership in making interactive R tutorials has
helped make R central to Data Science training. 

What does make up for the lack of video tutorials is that R’s
documentation for its packages are usually more thorough, and now
increasingly include a vignette for common use cases. Couple that with
the fact that there are more R packages, which are often quite targeted
to specific cases, the vignettes can cover some really important ground.

Lastly, R-blogger's has been an indespinsible player in R's growth as 
there really isn't an equivalent for Python or Julia or ...



#### Packages 

We've mentioned Pandas and dplyr as indispensible foundations for data science 
process. But since a good bit of focus on this project early on is the scraping, 
we should mention the options here as well. Though R has recently made strong initial steps with web-scraping
packages from [Hadley Wickham](http://@hadleywickham) and friends with
[rvest](https://cran.r-project.org/web/packages/rvest/index.html), still
the natural choice for our web-scraping task was Python’s BeautifulSoup
package.

The choice seemed natural here, not just because BeautifulSoup is at a
more mature development stage, but (and maybe we’re wrong here) it seems
like Python has more and better tutorials out there, in general, as
mentioned above. 

#### Up Coming 

We'll talk about IDEs and Notebooks.

