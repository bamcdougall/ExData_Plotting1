##  This Rcode file is submitted as part of Project Assignment #1
##  of the course "Exploratory Data Analysis"
##  in the Data Science Specialiation of Johns Hopkins Univerity
##  through Coursera
##  Author / Date:  Brendan McDougall / 4/09/2015
###
##  Assigment is outlined in ReadMe.md file.  In summary,
##  load txt formatted data & generate plot series that
##  matches extant set of plots
###
##  Methdology:
## (1a) Load dyplyr library, so table manipulation is easier;
## (1b) Load Lubridate library, so date handing is "R-managed";
## (2a) Read data -> (2b) Transform data for plotting;
## (3)  Plot data per assignment instruction generating
##      plots 1-4 and a png file with each plot.
###
## Part (1):
library(dplyr)
library(lubridate)
## Part (2a):
curDir <- getwd()
fileList <- dir()

subTblDF <- tbl_df(
    read.csv2(fileList[2], stringsAsFactors = FALSE, na.strings = "?",
#               colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
              )
) %>% # Part (2b)
    filter(
        Date == "2/1/2007" | Date == "2/2/2007"
    ) %>%
    mutate(UTCdate = mdy_hms( paste(Date, Time) ) ) %>%
    select(
        UTCdate, Date, Time, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3
    )  %>%
    mutate(
        Global_active_power = as.numeric(Global_active_power),
        Global_reactive_power = as.numeric(Global_reactive_power),
        Voltage = as.numeric(Voltage),
        Sub_metering_1 = as.numeric(Sub_metering_1),
        Sub_metering_2 = as.numeric(Sub_metering_2),
        Sub_metering_3 = as.numeric(Sub_metering_3)
    )
print(subTblDF)
## (3) Plot Data