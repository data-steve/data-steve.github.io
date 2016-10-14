And even this very novel application of [globe-wrapping the data](http://blog.revolutionanalytics.com/2016/10/warming-globe.html).

# http://www.radicalcartography.net/index.html?histland

it's odd to have more readings in the north because we have disproportionally more water the further we go south

## Static view of latitudinal collection of global temp data over time

I thought summing the number of recording per latitude row for each matrix would be a good method for checking to see how the collection of data have evolved over time.

y <- matrix(NA, nrow=length(dat_mat), ncol=37)
colnames(y) <-c(rownames(dat_mat[[1]][[2]]),"ym")

for  (i in seq_along(dat_mat)){
  y[i,1:36]   <- rowSums(data.frame(dat_mat[[i]][[2]]))
  y[i,"ym"] <- dat_mat[[i]][[1]]
  # y[i,"mo"] <- substr(dat_mat[[i]][[1]],6,7)
}

yy <- as.data.frame(y, stringsAsFactors = FALSE)
ticks <- yy$ym[seq(12,2000,by=96)]
yy %>%
  mutate_each(funs(as.integer),-ym) %>%
  gather(lat, n,-ym) %>%
  mutate(ym = factor(ym, levels=ym, ordered=T)) %>%
  ggplot(aes(x=ym,  y=factor(lat, levels=colnames(y)))) +
  geom_tile(aes( fill=n)) + theme(legend.position="none")+
  viridis::scale_fill_viridis(option = "magma") +
  ylab("latitude") + xlab("Date (y/m)") +
  scale_x_discrete(breaks = ticks) +
  ggtitle("Number of Readings by Latitude and Year-Month") + theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ggsave(file.path(home,"plots/ym_lat_readings.png"))


![](/images/ym_lat_readings.png)





Things like distance from Equator can definitely influence the temperature values that are recorded. And of course the general sparsity of the matrix filling in over the decades, increasingly more so for the Southern Hemisphere after the 1900s and at the Equator after the 1970s. Interestingly, you can also pick up the influence of the World Wars from 1911-1915 and again 1941-1945.

These two visualizations could not have been possible without the effort that many governments have gone to make their data open access. I applaud these efforts.

From this exercise I have learned that the geo-spatial nature of the data collection process over the decades have been unevenly distributed but much ground has been made in the last few decades. 

However, one note of concern does linger. The second graph in particular seems to show increasing trends of collecting disproportionally more data in disproportionally warmer places. The extreme sparsity in early year is leveraging fewer points collected in cooler regions to represent the state of the world in that time period. One hopes that the current weather models are accurately accounting for the definite patterns of disproportionately more observations in hitherto unrespresented warmer areas. The historic evolution of data generation process needs to be a variable in the model.




# http://www.fromthebottomoftheheap.net/2016/03/25/additive-modeling-global-temperature-series-revisited/
tmpf <- tempfile()
curl_download("http://www.metoffice.gov.uk/hadobs/hadcrut4/data/current/time_series/HadCRUT.4.4.0.0.annual_ns_avg.txt", tmpf)
gtemp <- read.table(tmpf, colClasses = rep("numeric", 12))[, 1:2] # only want some of the variables
names(gtemp) <- c("Year", "Temperature")

gldata <- readLines(file.path(home,"data/HadCRUT.4.4.0.0.annual_ns_avg.txt"))


v <- matrix(NA, nrow=length(gldata), ncol=13)

colnames(v) <-c("year",month.abb)

for( i in seq_along(gldata)){
  v[i,] <- strsplit(gldata[i],"\\s+")[[1]]

}