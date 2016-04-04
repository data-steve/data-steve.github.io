if (!require("pacman")) install.packages("pacman")
pacman::p_load(dplyr, tidyr, ggplot2,tm, magrittr)
pacman::p_load_gh("trinker/clustext")
pacman::p_load_gh("yoni/r_we_the_people")

home <- "~/Desktop/whitehouse_gov/"
#"https://github.com/yoni/r_we_the_people/blob/master/data/"


dat <- load(cl::go(home,"data/petitions.RData"))

con <- url("https://github.com/yoni/r_we_the_people/blob/master/data/petition_analyses.RData")

dat <- read.csv("~/Desktop/wtp_data_petitions.csv", stringsAsFactors = FALSE, header = FALSE)

names(dat) <- c('serial', 'id', 'type', 'title',  'body', 'signature_threshold',
                'signature_count', 'signatures_needed', 'url', 'deadline',
                'status', 'created')

ttl <-  clustext::data_store(dat$title, stem = FALSE, stopwords = NULL)

myfit  <- clustext::hierarchical_cluster(ttl )
plot(myfit, k=50)

body <-  clustext::data_store(dat$body, stem = FALSE, stopwords = NULL)

body <-  clustext::data_store(dat$body, stem = TRUE)

myfit  <- clustext::hierarchical_cluster(body )
plot(myfit, k=50)
