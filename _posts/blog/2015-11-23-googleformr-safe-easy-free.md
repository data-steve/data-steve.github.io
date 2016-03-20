---
layout: post
title: get data - safe, easy, and free
---



<div  style="max-width: 1020px; max-height: 263px; padding-bottom: 25.8%;">



<img src="/images/googleformr_signpost.png"   width="1020" height="263">

</div>




In my [last post on open-source
thanksgiving](_posts/2015-11-21-why-R-u-thankful.md),
I described a side project I’m running for the holidays (at least)
collecting what about R makes useRs thankful. I put an example function
[**googleformr**](https://github.com/steventsimpson/googleformr)**::why\_R\_u\_thankful()**
into the package to facilitate the project. Use the code below to
participate by sharing your own thanksgiving.

``` 
if (!require(“pacman”)) install.packages(“pacman”)
pacman::p_load_gh(“steventsimpson/googleformr”)
```

``` 
googleformr::why_R_u_thankful("") # <- your answer goes in quotes
```

#### googleformr Genesis 

**googleformr** came out of a persistent series of questions: How to
collect data remotely? And do it programmatically with R? And safely,
easily, and free?

Google seemed like an obvious choice. So gmail it? Save it as a
spreadsheet and then email it? Aggregation is really an issue here.

Or do the public Google Sheets? or private Google Sheets with
permissions set and authorizations required? A real hassle if you just
want to collect new data. And writing directly to Spreadsheets, you may
accidentally overwrite your own data.

Or maybe Dropbox? And public folder? But same problem as public Google
Spreadsheets, people can not only write to the resource, but also read
and edit it potentially.

#### The Ah-ha 

And then, it hit me. All those class surveys I used to send out as a
research prof, trying to be a better instructor. The students saw the
pretty surveys, I saw the clean tabular data. They could write the data,
but only what I gave them as a choice and always to a new row.

So, I hit on the idea to POST data to a Google Form as a way to publicly
expose a data collection point, but with more control about what and how
it could be written into my tables. It’s like your very own POST API.

Not only is Google Forms a great little public data interface that R can
POST to, but can begin to imagine ways of leveraging that behavior in a
lot of interesting ways. More about that in later posts.

#### googleformr 

I wrote the
[**googleformr**](https://github.com/data-steve/googleformr) ****
package with some wrapper functions around the httr and rvest packages
that helps facilitate POSTing information to your very own Google Forms.
You just send the data, Google Forms handles the organization.
Additionally, they email you each time you get a posting.

Once you create your Google Form as you like on your own account, my
package helps you get the info you need to build functions that write
directly to that form.

The 0.0.1 version of the package lets you get the POST data. More
functionality around data validation and reading from your private
spreadsheet is anticipated in future updates.


