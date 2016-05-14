pacman::p_load(dplyr, ggplot2, tidyr)
mkdat <- function(x,y,cat){

}

dat <-data.frame("Jessica" = c(8.6, 9.3, 9.34, 9.1, 9),
                 "Francine" = c(9.4, 8.88, 9.2, 9.24, 9.34),
            "Events" = factor(1:5,labels=c("sprint", "hurdles","javelin", "discus", "hi-jump")))

ggdumbbell <- function(d
                       ,colors=c("green4","red3","brown")
                       ,sz=17){
    nms <- names(d)
    names(d) <- c("xvar","yvar", "fvar")
    df <- d %>%
        dplyr::mutate(
               abs_diff = abs(xvar-yvar),
               pos_neg = sign(xvar-yvar),
               midpoint = abs_diff/2,
               clr = ifelse(pos_neg>0, colors[1], colors[2])
          ) %>%
      dplyr::rowwise() %>%
      dplyr::mutate(xmin = min(xvar,yvar),
             xmax = max(xvar,yvar)) %>% ungroup

    df_tall <- df %>%
        tidyr::gather(keys, values, -c(fvar, xmin, xmax, midpoint, pos_neg, abs_diff, clr)) %>%
        mutate(keys=ifelse(keys=="xvar", nms[1], nms[2]))

    l <-  as.character(df[["fvar"]][as.integer(df[["fvar"]])==max(as.integer(df[["fvar"]]))])
    ll <- if(d[1,1]<d[1,2]) nms[1:2] else nms[2:1]
ggplot(df_tall, aes(y=fvar, x=values) )+
  geom_segment(data=df, aes(x=xmin, xend=xmax, y=fvar, yend=fvar, alpha=abs_diff), color=df$clr, size=3) +
      geom_point(color = colors[3], size=5.5)  +
      geom_point(shape=21, color = colors[3], size=4.8, aes(fill=keys))  +

      scale_fill_manual(values = c("white", colors[3]), guide=FALSE) +

      theme_bw()  +
  theme(text=element_text(size=sz),legend.position="none", panel.grid = element_blank() )  +
  annotate("text"
           , x = c(df[df$"fvar"==l,]$xmin,df[df$"fvar"==l,]$xmax)
           , y= c(df[df$"fvar"==l,]$fvar,df[df$"fvar"==l,]$fvar)
           , label=ll
           , color = colors[3], size=4.8 , vjust = 2.5) +
  labs(list(x="Values",y=nms[3])) +
  annotate("text", x=8.75, y=5, label="Green/Red signifies\nhigher/lower performance.\n\n Color intensity signifies\nimporance of difference.", color=colors[3], size=7, vjust = .75)
}

ggdumbbell(dat) +
  # ggtitle("Jessica's performance against Francine") +
  ggsave("~/Documents/repos/data-steve.github.io/images/dumbbell.png")
