---
layout: post
title: posting to Medium and Jekyll from R
tags: [R, Jekyll, Medium]
---

Being relatively new to blogging as an outlet for research, data-sciency, or R-dev interactions, I came to it with some instincts toward a WISIWIG platform that leveraged tech to provide an excellent authoring experience, community interaction tooling, and network effects which are becoming standard issue for media platforms that don't create their own content.

### Medium

That's why after some preliminary research, Medium was my first choice. Generally, authoring, reading, and interacting with the community are all pretty instinctual experiences. I like how you can highlight or comment on anyone's content and those interactions are available to others and stored as a record on my own page. Such an intuitive interaction tool improves the reader experience and appropriately exacts a social costs on those who troll or create undesirable content.

But to keep you on their site, they don't allow for feeds of the full content to leave their system. At first, I viewed that as a Hotel California kind of thing:

> ... We are programmed to receive.
> You can check out anytime you like
> But you can never leave ...

Yet my econ-training reminds me that some network rules make for a better network. And the best way to sanction trolls and re-invest social interaction back into the system is if the system stays intact. 


### Jekyll + So Simple Theme

Several on my team are wary of wanting to host a WordPress-like blog. And to be honest after setting one up and playing with theme-hacking to get a nice look, I can understand. A lot of the themes out there that I saw had either too many design frills or too bare-bones, back-end programmer feel.

So I'm glad to have found a Medium-esque Jekyll theme at [So Simple Theme](https://mmistakes.github.io/) on [github.io](https://mmistakes.github.io/so-simple-theme/). (This jekyll theme is not same as the WP versions by same name.) The theme was fairly close to what I wanted and came with [good set-up documentation](https://mmistakes.github.io/so-simple-theme/theme-setup/) to make some further edits. If you're happy with the base theme, it's a dead simple set up the `_config.yml` file. I edited mine some to make it a bit more sleek and modernist. But not much.  

The theme also came with some benefits. It also had feed.xml generator built in for auto-rss generation.


### Github.io

Having a github.io account is free on Github, and Github will auto-build and serve your Jekyll-based blog. With every edit, it will detect changes to the code and rebuild it. 

I really like being able to copy almost word-for-word my package ReadMe demo markdown and paste it directly into a blog post. And I like that github.io will fee

I think  and others that every other 21st century a desire for I thought I was a newbie for falling for the slick easy conveniences of Medium instead of the command-line workflow of Jekyll. 

Based on some research and feedback, 
from medium2jekyll to medium+jekyll 