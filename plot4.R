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
##  (1) Title = None
##  (2) ylabel = "Energy sub metering"
##  (3) xlabel = None
##  (4) Save plot to a PNG file with width = 480 px and height = 480 px
windows(width=6.6667,height=6.6667) # in windows, sets screen display to 480pX480p
par(
    mfrow = c(2, 2),        # explicitly set plot device to draw 4X4 graph
    mar = c(2, 2, 1, 1),    # explicitly set margins around plot to default class values
    oma = c(1, 1, 1, 1)     # explicitly set outer margin such that a line of text could be added
)

with(subTblDF, {
    # windows(width=6.6667,height=6.6667, ) # in windows, sets screen display to 480pX480p
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Global_active_power"]], type = "l", lty=1, col = "black",
        main = "", ylab="Global Active Power", xlab = ""
    )
    
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Voltage"]], type = "l", lty=1, col = "black",
        main = "", ylab="Voltage", xlab = "datetime"
    )
    
    with( subTblDF, plot(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_1"]], col = "black",
                         type = "n",
                         ylab="Energy sub metering", xlab = "",
    )
    )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_1"]], col = "black") )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_2"]], col = "red") )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_3"]], col = "blue") )
    legend(
        "topright", lty= c(1,1,1), col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Global_reactive_power"]], type = "l", lty=1, col = "black",
        main = "", ylab="Global_reactive_power", xlab = "datetime"
    )
})
##
## generate PNG file using png graphics device and turn PNG graphic device off
##
png(filename = "plot4.png",
    width = 480, height = 480)

par(
    mfrow = c(2, 2),        # explicitly set plot device to draw 4X4 graph
    mar = c(4, 4, 2, 1),    # explicitly set margins around plot to default class values
    oma = c(1, 1, 1, 1)     # explicitly set outer margin such that a line of text could be added
)

with(subTblDF, {
    # windows(width=6.6667,height=6.6667, ) # in windows, sets screen display to 480pX480p
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Global_active_power"]], type = "l", lty=1, col = "black",
        main = "", ylab="Global Active Power", xlab = ""
    )
    
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Voltage"]], type = "l", lty=1, col = "black",
        main = "", ylab="Voltage", xlab = "datetime"
    )
    
    with( subTblDF, plot(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_1"]], col = "black",
                         type = "n",
                         ylab="Energy sub metering", xlab = "",
    )
    )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_1"]], col = "black") )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_2"]], col = "red") )
    with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_3"]], col = "blue") )
    legend(
        "topright", lty= c(1,1,1), col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    plot(
        subTblDF[["UTCdate"]], subTblDF[["Global_reactive_power"]], type = "l", lty=1, col = "black",
        main = "", ylab="Global_reactive_power", xlab = "datetime"
    )
})
dev.off()