pacman::p_load(dplyr, ggplot2, tidyr)
mkdat <- function(x,y,cat){

}

dat <-data.frame( "Jessica" = c(8.6, 9.3, 9.34, 9.1, 9),
            "Francine" = c(9.4, 8.88, 9.2, 9.24, 9.34),
            "Events" = factor(1:5,labels=c("sprint", "hurdles","javelin", "discus", "hi-jump")))

ggdumbbell <- function(d
                       ,colors=c("darkgreen","red","brown")
                       ,sz=17){
    nms <- names(d)
    names(d) <- c("xvar","yvar", "fvar")
    df <- d %>%
        dplyr::mutate(
               abs_diff = abs(xvar-yvar),
               pos_neg = sign(xvar-yvar),
               midpoint = abs_diff/2,
               color = ifelse(pos_neg>0, colors[1], colors[2])
          ) %>%
      dplyr::rowwise() %>%
      dplyr::mutate(xmin = min(xvar,yvar),
             xmax = max(xvar,yvar)) %>% ungroup
    df_tall <- df %>%
        tidyr::gather(keys, values, -c(fvar, xmin, xmax, midpoint, pos_neg, abs_diff, color)) %>%
        mutate(keys=ifelse(keys=="xvar", nms[1], nms[2]))

    l <- max(as.integer(df[["fvar"]]))
    topcat <- df_tall[as.integer(df_tall$fvar)==l,]$keys
browser()
    ggplot2::ggplot(df_tall, aes(y=fvar, x=values) )+
      geom_segment(data=df, aes(x=xmin, xend=xmax, y=fvar, yend=fvar, alpha=10*abs_diff, color=color), size=3) +
      geom_point(color = colors[3], size=5.5) +
      geom_point(shape=21, color = colors[3], size=4.8, aes(fill=keys)) +
      geom_text(df[df],aes(x=values,y=l,labels=keys)) +
      scale_fill_manual(values = c("white", colors[3]), guide=FALSE) +
      theme_bw() +
      theme(text=element_text(size=sz),legend.position="none", panel.grid = element_blank() )  +
      annotate("text"
               , x = c(df[["xmin"]][l],df[["xmax"]][l])
               , y= c(df[["fvar"]][l],df[["fvar"]][l])
               , label=paste0(df_tall[as.integer(df_tall$fvar)==length(unique(df_tall$fvar)),]$keys,"\nscore")
               , color = colors[3], size=4.8 , vjust = 1.5) +
      labs(list(x="Values",y=nms[3]))
}

ggdumbbell(dat)




paste0(unique(ttt$keys),".\navg")
ttt <-

  ggplot(df_tall, aes(y=fvar, x=values) )+
    geom_segment(data=df, aes(x=xmin, xend=xmax, y=fvar, yend=fvar, alpha=abs_diff, color=color), size=3) +
    geom_point(color = "brown", size=5.5) +
    geom_point(shape=21, color = "brown", size=4.8, aes(fill=keys)) +
    scale_fill_manual(values = c("white", "brown"), guide=FALSE) +
    theme_bw() +   theme(legend.position="none", panel.grid = element_blank() ) +
    annotate("text", x = c(,df[1, "xmax"]) ,
             y= c(df[1,"fvar"],df[1,]$fvar),
             label=paste0(unique(ttt$keys),".\navg"), color = "brown", size=4.8, fill="brown" , vjust = 1.5)


  +
    ggtitle("Your Avg. CE score relative to Dept Avg\nBy Teaching fvar") +
    xlab("Avg. CE scores") + ylab("Teaching fvars") +
    annotate("text", x=4.35, y=5, label="Green/Red signifies\nhigher/lower than\ndept avg. CE scores.\n\n Color intensity signifies\nmagnitude of difference.", color="brown")
