##
#  Generate a scatterplot of Global Active Power vs Time
#  (1) Title = "Global Active Power"
#  (2) ylabel = "Global Active Power (kilowatts)"
#  (3) xlabel = None
#  (3) Top Left Margin Text = "Plot1"
#  (4) Save plot to a PNG file with width = 480 px and height = 480 px
plot(
    subTblDF[["UTCdate"]], subTblDF[["Global_active_power"]], type = "l", lty=1, col = "black",
     main = "Global Active Power", ylab="Global Active Power (kilowatts)", xlab = ""
     )
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(2, 2, 2, 2))
mtext("CAUTION:  generate PNG File", outer = TRUE)
