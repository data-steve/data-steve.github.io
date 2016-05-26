---
layout: post
title: Stop Shiny and Close Browser Together
tags: [R, Shiny, Javascript  ]
---

<img src="/images/shutdown.png" width="240" style="float:right;margin:10px;">

I've been playing with **shiny** at work for a project [Tyler](https://github.com/trinker/) and I have been pushing forward.


#### My Goal

We wanted to be able to deploy local instances of shiny app and then when user is done with session, the user can close out the session by closing the browser and shutting down shiny server at same time.

StackOverflow and Google groups had several stepping stones to help in the process, which with a bit of refactoring did the trick. The [first link](http://stackoverflow.com/questions/35306295/how-to-stop-running-shiny-app-by-closing-the-browser-window) pointed to the javascript snippet I could possibly use, though no real suggestions on how to use it.

    session$onSessionEnded(function() {
        stopApp()
    })

[Next](https://groups.google.com/forum/#!searchin/shiny-discuss/insert$20javascript/shiny-discuss/F3GOgIJnRVs/iXfSqSCmCgAJ), shiny's google group had a tip on inserting Javascript into shiny, which didn't work for me but evidently did for others. Then, [back at StackOverflow](http://stackoverflow.com/questions/24526403/timing-events-when-session-ends/24646283#24646283), I found that **the javascript above has its drawbacks if a user refreshed their session midway.** 



#### My Solution and Edit

The solution that works for me in this minimal shinyApp demo was to edit the SO answer at the last link. (At time of this post, my edit had not been approved yet, so you may find the SO link has code that doesn't work.)  Basically, just add a close button that shuts down shiny server locally and closes browser, simple enough. And in shinyUI, one could possibly make this button appear only once end of app session was complete.  

I had to edit the original answer because I couldn't get the proposed solution to `observe` the `stopApp()` command before `window.close()` closed the connection to shiny. So, I added a simple `setTimeout` solution around the `window.close();` action to give shiny enough time to `observe`, combining this [SO absolute minimal clue of an answer](http://stackoverflow.com/questions/951021/what-do-i-do-if-i-want-a-javascript-version-of-sleep) with [good ol' W3's practice session example](http://www.w3schools.com/jsref/met_win_settimeout.asp).

    library(shiny)
    runApp(list(
      ui = bootstrapPage(
        tags$button(
          id = 'close',
          type = "button",
          class = "btn action-button",
          onclick = "setTimeout(function(){window.close();},500);",  # close browser
          "Close window"
        )
      ),
      server = function(input, output) {
        observe({
          if (input$close > 0) stopApp()                             # stop shiny
        })
      }
    ))

I thought I'd write all this up in one place so that all my running around wasn't a waste.

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,shiny,js,datascience" data-dnt="true">Tweet</a>