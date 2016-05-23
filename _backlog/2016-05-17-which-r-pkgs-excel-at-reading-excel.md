---
layout: post
title: Which R pkgs Excel at Reading Excel
tags: [R ]
---


googlesheets vs. readxl vs. gdata vs. xslx 

home <- cl::l_drive_go("swiper/DataScience/valiData_remix")

path <- cl::go(home,"Core_Data_Dictionary_DS_longforms.xlsx")
ll <- gdata::read.xls(path, sheet="column_dictionary")

ll2  <- xlsx::read.xlsx2(path, sheetName="column_dictionary")