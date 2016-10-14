---
layout: post
title: 'Other Global Temp Stats'
tags: [R, geo]
---

A couple months ago there were datavizs showing global average temp trends all over the media. Several of them (e.g., [1](http://www.fromthebottomoftheheap.net/2016/03/25/additive-modeling-global-temperature-series-revisited/) and [2](https://rud.is/projects/hadcrut4/))  used the same HadCRUT global temperature anamolies data, analyzing it with different techniques or technologies to highlight specific statistics, namely the mean. I liked [@ucfagls's](twitter.com/ucfagls) simulation work on the averaged data and [@hrbrmstr's](twitter.com/hrbrmstr) incorporation of the error model's confidence intervals over time.

Seeing the same data visualized several times helped me process it more deeply. Though the main take-away was most often emphasizing the difference in the average temperature over the trend, I thought a few other points were rather interesting. 


![](ftp://ftp.ncdc.noaa.gov/pub/data/noaa/station-chart.jpg)

### Long and Kinky Distribution

The 3 things that really stood out to me were: 1) the data started around 1850, 2) the data combine sea-surface and land-surface temperature readings from different data sets, and 3) there appeared to be 3 kinks in the trend:

- some time around 1900 going upwards, 
- then again around 1940 going downwards, and 
- once again going up some time after 1970. 

![](http://www.metoffice.gov.uk/hadobs/hadcrut4/data/current/web_figures/hadcrut4_annual_global.png)

These kinks were especially apparent in the [HadCRUT website's own visualization](http://www.metoffice.gov.uk/hadobs/hadcrut4/data/current/web_figures/hadcrut4_annual_global.png) above (if you are patient enough to look past the glaring red bars) or [@ucfagls's first graph](http://www.fromthebottomoftheheap.net/assets/img/posts/additive-modeling-global-temperature-series-revisited-plot-temperature-data-1.png). 

The overall upward trend is the typical story; but the downward trend over a 3 decade period (1940-1970) seemed odd to me, especially 3 decades of massive economic growth and consumption around the world. My training in economics suggested that kinks like these had systemic influences; my economics training also suggest I try to understand the data generation process, especially shifts in when sea-surface and land-surface readings became the dominant sources of measurement. Again, @hrbrmstr's work did some of the best work incorporating uncertainty estimates; although, the [Wikipedia page on sea surface temperature estimates](https://en.wikipedia.org/wiki/Sea_surface_temperature) really makes the distinct shifts in 95% confidence intervals over time evident. 

![](/images/wiki_sea_surface.jpg)


### Global Averages over Time and Space

I wanted to look further into this using disaggregated HadCRUT data; but following the link to the HadCRUT4 data at [@hrhrmstr's](https://rud.is/projects/hadcrut4/) made me realize one reason why there was a strong preference for using the global averages data instead of the disaggregated data, of which there are copious and sprawling amounts. 

There are tens of thousands of locations from which the data are collected and these locations have all come in and out at different times of the years. Also, parsing the text files they come in, though definitely doable, is a chore. And I'm lazy, especially as this is just a hobby. So, I decided to leverage my laziness and find another way to get some disaggretaed data.


### stationaRy data

Which brings us to the beautiful work of [@riannone](https://twitter.com/riannone) with his github package  [stationaRy](https://github.com/rich-iannone/stationaRy) for hooking up to the NOAA api to access the Integrated Surface Database (ISD). According the NOAA website (https://www.ncdc.noaa.gov/isd):

> "ISD integrates data from over 100 original data sources... [and] includes 35,000 stations worldwide, with some having data as far back as 1901."

HadCRUT data contains sea and land data, whereas NOAA's ISD data only contains sland data. Still 35,000 stations 116 years from 100 original sources should still make for a very interesting opportunity.  I did also take note of the fact that this comprehensive compendium of land data starts in 1901, very close in the region of our first kink. Speculative, but interesting.


Though stationaRy doesn't have sea-surface data, it makes up for it by having something almost better for my lazy purposes, a dataframe of all the land-based air measurement locations by year and longitude and latitude from 1901 till now; so I didn't even need to hit the NOAA API to check out the distribution of air temperature collection points over time and space. In fact, I don't even need to look at actually temperature data to have some interesting exploration.

One of the first 

count(stn_df,begin) %>%
  arrange(begin) %>%
  mutate(cumsum=cumsum(n)) %>%
  ggplot(aes(begin,cumsum)) + geom_line(color="blue") + theme_minimal() +
  ggtitle("Cummulative Stations by Year") +
  ggsave("./plots/cumsum_yearly.png")

# number weather stations added per year
max_yr <- count(stn_df,begin) %>% filter(n==max(n))
count(stn_df,begin) %>%
  ggplot(aes(begin,n)) + geom_line(color="blue") +
      annotate("text"
            , x=max_yr$begin+4  # lazy offset
            , y=max_yr$n
            , label=as.character(max_yr$begin)) +
  ggtitle("Stations Added by Year") + theme_minimal() +
  ggsave("./plots/added_yearly.png")

# by top 5 countries of time
top_5_countries <- stn_df %>%
  # filter(begin==1973) %>%
  count(country) %>%
  arrange(desc(n)) %>% head(5) %>% .[["country"]]


stn_df %>% 
  filter(country %in% top_5_countries) %>%
  count(country, begin) %>%
  arrange(country,begin) %>%
  mutate(cumsum=cumsum(n)) %>%
  ggplot(aes(begin, cumsum, group=factor(country)
             ,color=factor(country))) + geom_line() + 
  scale_color_brewer(palette = "Set2") + theme_minimal() +
  labs(list(title="Top 5 Countries Cummulative Counts", color="Top 5") )+
  ggsave("./plots/top5_cumsum.png")

# plot it
stn_df %>%
  mutate(decade = round(begin/10)*10,
         lat=round(lat/5)*5,
         long=round(lon/5)*5) %>%
  count(decade,lat, long) %>%
  filter(decade<=2010) %>%
  arrange(n) %>%
  ggplot(aes(long,lat)) +
    geom_point(aes(size=n, color=n)) +
    facet_wrap(~decade, nrow=2) + theme_bw() +
  ggtitle("Stations Counts by Lat and Long by Decade") +
  ggsave("./plots/lat_long_decade.png")

# plot it
stn_df %>%
  # filter(begin==1973) %>%
  mutate(lat=round(lat/5)*5,
         long=round(lon/5)*5) %>%
  count( begin, lat, long ) %>%
  filter(begin>1970&begin<=1980) %>%
  arrange(n) %>%
  ggplot(aes(long,lat)) +
  geom_point(aes(size=n, color=n))+
  facet_wrap(~begin, nrow=2) + theme_bw() +
  ggtitle("Stations Counts by Lat and Long by Decade") +
  ggsave("./plots/lat_long_1970.png")


stn_df %>%
  group_by(begin) %>%
  summarize(dist_from_equator = mean(abs(lat))) %>%
  arrange(begin) %>%
  ggplot(aes(begin,dist_from_equator)) + 
  geom_smooth(se=F)  +
  ggtitle("Stations Yearly Average Distance from Equator") +
  ylab("") +
  ggsave("./plots/latitude_yearly.png") 
   

stn_df %>%
  mutate(decade = round(begin/10)*10, lat=round(lat/10)*10) %>%
  filter(decade<=2010) %>%
  count(decade, lat) %>% 
  arrange(lat) %>% 
  ggplot(aes(x=decade, y=lat, group=factor(lat))) + theme_classic() +
  geom_line(aes(size=n^1.5)) + scale_size(guide = 'none') +
  labs(list(title="Stations Added by Decade and Latitude", y="latitude", x="decade")) +
  ggsave("./plots/stations_lat_decade.png")


