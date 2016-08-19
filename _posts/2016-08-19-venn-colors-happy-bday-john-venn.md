---
layout: post
title: 'Venn Colors: Happy Bday, John Venn'
tags: [R, dataviz]
---

<img src="/images/venn.png" width="600">

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats, dataviz, datascience" data-dnt="true">Tweet</a>

I know that venn diagrams are not as sexy as they used to be and that John Venn's birthday was <a href="https://flowingdata.com/2014/08/04/google-doodle-venn-diagram/" target='_blank'>actually Aug 4</a>, but venn diagram's still serve a purpose here and there, especially if we can get some more interesting colors in there.

Plus, this question on <a href='https://stat.ethz.ch/pipermail/r-help/2010-October/255807.html' target='_blank'>how to hack the venneuler color palette</a> appears to have gone unanswered for a couple years.

The `venneuler::venneuler` function doesn't come with a color option directly accessible. However, venneuler package has an unexported plot method `venneuler:::plot.VennDiagram` that does have a color option that takes hex colors. 

The trick is to match the sequencing the labels that comes out of venneuler in the outputted object `vv` to the colors you want for each label. I hack that below by using `match(vv$labels, names(colors))`. This allows you to get consistent results on coloring and labels across uses.

    # define labels
    labels <- c("Happy", "Bday")
    # define colors
    colors <- c("#7709d2","#64D209")
    # name colors with labels
    names(colors) <- labels
    
    # some toy data    IMPORTANT PART IS THAT 
    mat <- matrix(c(1880,270,270,470), nrow=2, ncol=2)
    colnames(mat) <- labels
    rownames(mat) <- labels



    make_venn <- function(dat, title="",fill_cols=NULL
                          , alpha=.7, title_font=1){
      vv <- venneuler::venneuler(dat)
      if (!is.null(fill_cols)){
        plot(vv, main=title, font.main = title_font
        , col=fill_cols[match(vv$labels, names(colors))], alpha=alpha )
      } else {
        plot(vv, main=title, font.main = title_font, alpha=alpha)
      }
    }
    
    
    make_venn(make_dat(mat),title="Happy Birthday Venn!"
                ,fill_cols=colors, title_font=2)


The key to selecting colors in the venneuler is the thinking in terms of the labels and colors, but the venneuler package expects data have labels that include the co-occurence of the underlying labels:, e.g. `c(Happy=1880, Bday=470, "Happy&Bday"=270)`. 

This presents a slight problem when we've only specified the colors for the labels and not their co-occurence. To handle the conversion of a matrix to the structure venneuler expects, I've written a helper function `make_dat`. The function tests if the dat passed in is a matrix or a vector, if it is a vector whether the names contain the required `&` character.

    make_dat <- function(dat){
     if (is.matrix(dat)) {
          # self-datcuring
          dg <- diag(dat)
        
          # co-tags
          nm <-  nn <-  matrix(nrow=nrow(dat),ncol=nrow(dat))
        
        
          # get names and values from lower.tri
          for (i in seq_along(rownames(dat))){
            for (j in seq_along(rownames(dat))){
              if (i!=j) nm[i,j] <- paste(rownames(dat)[i],rownames(dat)[j], sep="&")
              if (i!=j) nn[i,j] <- dat[i,j]
            }
          }
          nn <- na.omit(as.vector(nn))
          nm <- na.omit(as.vector(nm))
          names(nn) <- nm
          c(dg,nn)
      } else if (any(grepl("&",names(dat)))){
          dat
      } else stop("Data format of dat object is incorrect\n\tEither is not a matrix or\n\tnames do not contain '&' for co-tags" )
    }
  
Happy Venn diagramming!

<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats, dataviz, datascience" data-dnt="true">Tweet</a>