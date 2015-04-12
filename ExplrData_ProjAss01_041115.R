################################################################################
##
##  Author:  Brendan McDougall
##  Proj Purpose: Project 1 of Exploratory Data Analysis / Johns Hopkins Univ
##  File Purpose: Acquire "experimental" data and transform into analytic data
##  MOOC:  Coursera
##  Course ID:  exdata-013
##  Date:  4/9/15, 4/11/15
##
##
################################################################################
##
##  System Info:  Windows 7, 64 bit, i7 processor, RStudio Version 0.98.1102
##                  R x64 3.1.2, git scm 1.9.5
##
################################################################################
##
## Revision History
##
##      4/9/15:     Completed project to first order:
##                  download data & generate plots
##
##                  Issues:  Plot formatting sufficient, but data are different
##                  Suspect cause:  data downloaded incorrectly or subsetted
##                  incorrectly
##
##      4/11/15:    Update git archive; started this ReadMe file
##
################################################################################
##
##  Methdology:
## (1a) Load dyplyr library, so table manipulation is easier;
## (1b) Load Lubridate library, so date handing is "R-managed";
## (2a) Read data -> (2b) Transform data for plotting;
## (3)  Plot data per assignment instruction generating
##      plots 1-4 and a png file with each plot.
##
################################################################################
##
## Part (1):
##
library(dplyr)
library(lubridate)
##
## Part (2a):
##
curDir <- getwd()
fileList <- dir()
##
##  raw data imported into R using tbl_df and chaining (%>%) of data transformations
##  per the workflow of the dplyr library, e.g. tbl_df vs data.frame
##
subTblDF <- tbl_df(
    read.csv2("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?",
    #            colClasses = c("date", "date", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
              )
)  %>% # Part (2b)
#     filter(
#         Date == "2/1/2007" | Date == "2/2/2007"
#    ) %>%
    mutate(UTCdate = dmy_hms( paste(Date, Time) ) ) %>%
    filter(
        UTCdate >= ymd("2007-02-01") & UTCdate < ymd("2007-02-03")
        )%>%
    select(
        UTCdate, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3
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
##
## (3) Plot Data
##