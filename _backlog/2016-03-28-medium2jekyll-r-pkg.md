---
layout: post
title: medium2jekyll R Package
tags: [R, Github, Jekyll]
---


![](/inst/m2jekyll.png)

<a class="github-button" href="https://github.com/data-steve/medium2jekyll" data-icon="octicon-star" data-style="mega">medium2jekyll</a>

A few months ago I went through the process of migrating my Medium blog account over to a Jekyll blog hosted github.io. 

To help with the process of migrating content over, I developed a set of scripts to handle the whole process. Though the main `medium2jekyll()` function assumes a Medium account as the target website, several of the helper functions are generic enough to pull down any html page with some automated refactoring to markdown template of text-heavy ones.


**medium2jekyll** assists  in migrating from a Medium blog to a jekyll-based blog, notably one hosted on github.io. Specifically, it helps with 
- text scraping/formatting html to markdown
- image downloading from posts
- markdown cleaning for post content extraction


### Installation

To port your own Medium blog, start by downloading the github package from here:

    pacman::p_load_current_gh("data-steve/medium2jekyll")



### Use for Transfer

Then all you need to start the process is your Medium handle from the url of your Medium blog.
For example, if url to your Medium page is `www.medium.com/@fun_times`, then `@fun_times`
is the handle. From this (or even the full url), **medium2jekyll** will start the transfer process.

Simply plop your Medium handle in the main **medium2jekyll** function like so:

    library(medium2jekyll)
    medium2jekyll("@fun_times")   # not a real medium acct
    
For this package to work for you, the medium account needs to use a medium.com url--ie, no custom domain names. Further, Medium's set up makes it kind a hard to get all your posts in a succinct list. Make sure your `medium.com` account has a Latest page, but typing `medium.com/@your_account/latest` to see if it populates a list of posts. If so, you should be good to go.

The function goes through the following steps:

  1. Creates a project folder ('blog_transfer') on your Desktop, with 2 subfolders: _posts and images. Both standard subfolders on Jekyll blog. 
  2. Facilitates an initial scrape of the medium.com/@fun_times/latest page, which is a concise listing of all posts for that account on a page that doesn't the content buried with in impenetrable layers of div tags.
  3. Then with those post links, the main function loops over each page and turns it into a cleaned markdown file, which respects highlighted code-chunks and embedded images / links. 
  4. Each posts markdown file is ends up in the /_posts subfolder, and any associated images are downloaded in the /images subfolder. 
  5. The markdown file is cleaned up and rebuilt so that all the links and boilerplate should render on a Jekyll platform.
  


### Use for New Posts

If you're like me, you wanted to transfer blog platforms because you not only have old content, but you also have new content. 
**medium2jekyll** comes with one helper function for this:

    new_post("some title")
    
`new_post()` has several things going on to save the file with the correct file-naming conventions that Jekyll expects, namely <grin>, one that has a date and file name as a markdown file. For example, `new_post("the end of the year", date = "2016-12-31")` would create and open a file named `2016-12-31-the-end-of-the-year.md` with markdown boilerplate already containing the title in titlecase.

`new_post()` is set up to check if your current working directory has `"github"` in the path. It also is going to create the file in a `"./_posts/"` subfolder, as this is where Jekyll looks for post content.


There are other aspects of the **medium2jekyll** package which are generically useful for converting html files to markdown that I may explore further at my new blog: [data-steve.github.io](data-steve.github.io). 


<a class="github-button" href="https://github.com/data-steve/medium2jekyll" data-icon="octicon-star" data-style="mega">medium2jekyll</a>