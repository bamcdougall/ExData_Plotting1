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
## Part (1a & 1b):
##
library(dplyr)
library(lubridate)
##
################################################################################
##
## Part (2a & 2b):
##
curDir <- getwd()
fileList <- dir()
##
##  raw data imported into R using tbl_df and chaining (%>%) data transformations
##  per the workflow of the dplyr library, e.g. tbl_df vs data.frame
##
subTblDF <- tbl_df(
    read.csv2("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?",
    )
)  %>%
    mutate(
        UTCdate = dmy_hms( paste(Date, Time) )
    ) %>%
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
################################################################################
##
## (3) Plot Data
##
##  Generate a scatterplot of Global Active Power vs Time
##  (1) Title = "Global Active Power"
##  (2) ylabel = "Global Active Power (kilowatts)"
##  (3) xlabel = None
##  (3) Top Left Margin Text = "Plot1"
##  (4) Save plot to a PNG file with width = 480 px and height = 480 px
plot(
    subTblDF[["UTCdate"]], subTblDF[["Global_active_power"]], type = "l", lty=1, col = "black",
    main = "Global Active Power", ylab="Global Active Power (kilowatts)", xlab = ""
)
par(
    mfrow = c(1, 1),        # explicitly set plot device to draw 1 graph
    mar = c(4, 4, 2, 1),    # explicitly set margins around plot to default class values
    oma = c(1, 1, 1, 1)     # explicitly set outer margin such that a line of text could be added
)
##
## generate PNG file using device copy command and turn PNG graphic device off
##
dev.copy(
    png,
    filename = "plot2.png",
    width = 480, height = 480
)
dev.off()