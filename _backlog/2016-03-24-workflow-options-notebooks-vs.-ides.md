---
layout: post
title: Workflow Options - Notebooks vs. IDEs
tags: [R, PYTHON, "DATA SCIENCE"]
---

Last time I talked about R and Python Choices, and why for the scraping part of this project
I went with Python with its more mature Beautiful Soup module. However, in the intro project
we led the way with some R work by Tyler on text analysis. (Sidebar: Tyler's doing some serious
heavylifting to port NLTK to R. Check it out over at his github repo: ntklr.)

Today we'll talk about our  experiences with different data science platforms.


#### Workflow: Notebooks vs IDEs 

One of the more interesting choices of this project was to venture into
Jupyter/iPython Notebooks instead of IDEs like Spyder, PyCharm…. Even
the new Desktop version of [ŷhat](https://www.yhat.com/)’s
[Rodeo](http://blog.yhathq.com/posts/introducing-rodeo.html) was a fun
recent diversion into Python interfaces and it clearly was a h/t to the
RStudio’s UX genius for IDEs.

And maybe that’s the greatest lesson wetook away from the Jupyter
notebook experience, UX/UI matters for productivity. Wouldn’t it be
great to marry the multi-language capability of Project Jupyter with the
UX/tools of RStudio IDE?

With longer development projects where the script is more the emphasis
than the specific output of that script (can anyone say “mtcars”?), a
Notebook seems to emphasize the part of the project, I’m most frequently
minimizing or closing after I run it. And when you have to scroll around
to different parts of the code to interactively edit each part, what I
really want is more views on the code, not the output. If one of these
IDEs had the multi-pane functionality of SublimeText editor, that would
be a major productivity enhancement.

And thus, my biggest complaint about the Notebook UX is probably its
main selling point. The output is always right under where(ever) the
code the created it happens. And (it seems to me) every code execution
adds to the in-memory data’s massiveness. At the end of this project the
Notebook was about 40+ MB as I processed the data into several forms,
from BeautifulSoup text to NumPy array to Pandas data.frame.

Again, this was a first real foray into interactive analysis on a
Notebook, and the functionality wasn’t fully explored. And one could
complain that a Notebook used as an IDE may not be using a Notebook to
its best purpose. [Others
commentators](http://www.partiallyderivative.com/news/2015/3/5/episode-16-algorithm-aversion)
have said it similarly: Notebooks appear to excel at building and
sharing projects where the main emphasis is on seeing what happened
after each code chunk was executed; so education or transparency
objectives would motivate this form. Nevertheless, [the nbviewer
repository that iPython is building up with targeted
tutorials](https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks)
AND [the amazing fact that they will render directly in
Github](http://blog.jupyter.org/2015/05/07/rendering-notebooks-on-github/)
(!) all argue for the Jupyter’s relevance to the data science landscape
and underscore how Pythonistas seems to be beating the pants off R in
woo-ing coders to their tools.

Though we sometimes wonder if this isn’t a software version of [the
desktop vs the
laptop](https://www.washingtonpost.com/news/innovations/wp/2014/04/11/why-the-best-companies-may-dump-the-laptops-pcs-and-programs-their-employees-love/)
battle of the past decade — as laptops did eventually supplant desktops
as their capabilities expanded with technological advancements — it
could in fact be that the more Notebooks try to replace IDEs, the more
they will have to look like a traditional IDE.

In the end, (for [one of us](http://medium.com/@data_steve) at least)
the notebook will likely enter into future work-a-day workflow in the
same way the SQL Server interface does, briefly for one-off tasks (or
admittedly in sharing the code for fun side projects): you fire it up to
handle one specific task like getting data of a server and then you use
your IDE to do the rest of the work. But having a workflow predefined
and primed for that task is valuable.

#### Up Coming 

Next post we’ll dive right into web-scraping content for the project.
And despite the hoo-ha above, we do intend to post on nbviewer a
notebook of our BeautifulSoup code at different stages.