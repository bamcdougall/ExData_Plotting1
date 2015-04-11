##
#  Generate a scatterplot of Global Active Power vs Time
#  (1) Title = None
#  (2) ylabel = "Energy sub metering"
#  (3) xlabel = None
#  (4) Save plot to a PNG file with width = 480 px and height = 480 px


par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(2, 2, 2, 2))
with(subTblDF, {
    
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
                         ylim=c(0, 33) # when data are subsetted correctly, expect that ylim set by Sub_metering_1
    )
    )
    # with( subTblDF, lines(subTblDF[["UTCdate"]], subTblDF[["Sub_metering_1"]], col = "black") )
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
    
    mtext("CAUTION:  generate PNG File", outer = TRUE)
})