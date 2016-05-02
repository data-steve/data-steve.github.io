---
layout: post
title: d3/R Streamgraph on White House Petition Data
tags: [d3,R,htmlwidgets, dataviz ]
---

![](/images/stream_still.png)

After last week's [post with the d3-htmlwidget chordplot](/d3-r-chord-diagram-of-white-house-petitions-data) showing the network of petition categories, in this post I decided to show the time trend aspect of how the petitions came in. I'm using [@hrbrmstr](https://twitter.com/@hrbrmstr)'s htmlwidgets wrapper of a d3 streamgraph to help visualize the macro- and tag-specific trends.

Compared to the chordplot, the time trend allowed by the streamgraph gives a whole new angle of data. Something substantial occurred around Nov 2012 to increase petition monthly submissions by 15+ fold. I'll explore this more in my next post.

If you like what you see, below try it yourself with the code below or follow along with  [@hrbrmstr's vignette](http://hrbrmstr.github.io/streamgraph/). 


<script>
.chord_plot {
    position: relative;
    padding-bottom: 0px;
    padding-top: 0px;
    height: 0;
    overflow: hidden;
}


.chord_plot iframe {
    position: absolute;
    top:0;
    left: 0;
    width: 100%;
    height: 100%;
}
</script>



<div class="chord_plot">
    <iframe src="/assets/streamgraph_tag_timetrend.html" height="550" width="950" allowfullscreen="" frameborder="0">
    </iframe>
</div>



##### Set up
    
    # load
    pacman::p_load(dplyr, magrittr, ggplot2, tidyr)
    pacman::p_load_gh("hrbrmstr/streamgraph")
    home <- "~/Desktop/whitehouse_gov/"
    load(file.path(home,"data/petitions.RData"))
    
    
    # get data if you need
    # data_url <- "https://github.com/yoni/r_we_the_people/blob/master/data/petitions.RData?raw=true"
    # curl::curl_download(data_url, destfile=file.path(home,"data/petitions.RData"))
    # this behaved much better than download.file() for me
    
    
    # reshape
    trend <- petitions %>%
        select(id, contains(".name"), created_POSIXct) %>%
        mutate(issues1.name= ifelse(is.na(issues1.name), issues.name, issues1.name)) %>%
        mutate_each(funs(ifelse(is.na(.), "", .)), starts_with("issues"))  %>%
        select(-issues.name) %>%
        tidyr::gather(order, tag, -c(id,created_POSIXct )) %>%
        filter(tag!="") %>%
        transmute(
          dates = as.Date(paste(lubridate::year(created_POSIXct)
                                           ,lubridate::month(created_POSIXct)
                                           ,"01", sep="-")) ,
                   order = tidyr::extract_numeric(order),
                   tag = tag) %>%
        group_by(dates, tag) %>%
        summarize(n=n()) %>% ungroup 


##### Streamgraph: Basics

Here's the basic set up for the streamgraph. As last time, I needed more colors 
than the basic RColorBrewer sets offered, so I expanded the set with gradients of it.

    # set number of colors needed
    colorCount <- length(unique(tt2$tag))
    
    # makes function to create palette
    getPalette <- grDevices::colorRampPalette(RColorBrewer::brewer.pal(9, "Set3"))

    # streams = counts
    trend  %>%
       streamgraph("tag", "n", "dates") %>%
       sg_axis_x(2, "month/year", "%m / %Y") %>%
       sg_fill_manual(values=getPalette(colorCount))


This view of the streamgraph shows a dramatic expansion of petitions being submitted 
around Nov 2012. Something substantial must have happened to get the word out about it.
    

      

##### Streamgraph: Options

The y-axis on the graph above is hard to interpret, try the `offset="zero"` option. 
You can also experiment with `interpolate=` to get linear or step trends. [@hrbrmstr's vignette](http://hrbrmstr.github.io/streamgraph/) has several examples.

    # use other streamgraph options
    trend  %>%
       streamgraph("tag", "n", "dates"
           , offset="zero"
               # ,interpolate="linear") %>%
       sg_axis_x(2, "month/year", "%m / %Y") %>%
       sg_fill_manual(values=getPalette(colorCount))

Sometimes I think its actually more interesting to see the streams showing the relative 
percentage each category had of the share of petitions coming in then. Though the raw magnitude
is obscured, sometimes it allows for other trends to become more salient. The masthead image is 
what you get with this example.

    # streams as percentages instead of counts
    trend %>%
      group_by(dates) %>%
      mutate(prop = n/sum(n)) %>%
      new_streamgraph("tag", "prop", "dates") %>%
      sg_axis_x(2, "month/year", "%m / %Y")%>%
      sg_fill_manual(values=getPalette(colorCount))  


In the last  [post with the d3-htmlwidget chordplot](/d3-r-chord-diagram-of-white-house-petitions-data) I ended by showing you how to save
the html via the RStudio Viewer options. Below I show how to use `htmlwidgets::saveWidget` to 
maintain programmatic control over the process.

    # save your streamgraph to html file
    trend  %>%
      streamgraph("tag", "n", "dates") %>%
      sg_axis_x(2, "month/year", "%m / %Y") %>%
      sg_fill_manual(values=getPalette(colorCount))%>%
      htmlwidgets::saveWidget(file.path(home, "test.html"))


I personally found that the default text setting on the streamgraph was too small once 
its opened in the browser. I tried for some considerable time to programmatically change the font size
natively from the streamgraph package. It appears not to support this in its `params` suboptions, though I have seen 
such elsewhere. 

So I created a (ugly) hack on the html. It goes into the css script for streamgraph and edits the `font` tag. You must have already saved the widget to html to use this function. If anyone has a better way, tweet me [@data_steve][twitter.com/@data_steve]

       change_font <- function(file, font){
        css_ptn = 'svg%20text%20%7B%0Afont%3A%20\\d+?px'
        txt <- readLines(file)
        prac <- txt[grep(css_ptn, txt)]
        txt[grep(css_ptn, txt)] <- gsub(css_ptn, paste0('svg%20text%20%7B%0Afont%3A%20',font,'px'), txt[grep(css_ptn, txt)])
        writeLines(txt, file)
      }


      change_font(file.path(home, "test.html"), 15)

<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script> <a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,datascience, d3,opendata" data-dnt="true">Tweet</a>