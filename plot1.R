##
#  Generate a histogram with 12 bins for Global Active Power
#  (1) Title = "Global Active Power"
#  (2) Label = "Global Active Power (kilowatts)"
#  (3) Top Left Margin Text = "Plot1"
#  (4) Save histogram to a PNG file with width = 480 px and height = 480 px
hist(
    subTblDF[["Global_active_power"]], breaks = 12, col = "red",
     main = "Global Active Power", xlab="Global Active Power (kilowatts)"
     )
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1), oma = c(2, 2, 2, 2))
mtext("CAUTION:  generate PNG File", outer = TRUE)
