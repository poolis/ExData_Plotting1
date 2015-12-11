# Read in the data
columnClasses = c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric")
plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                     colClasses = columnClasses, na.strings = "?")
# Filter for the two days that are of interest
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]
# Set up the plotting area
par(mfrow = c(1, 1))
# Create a histogram of Global Active Power
hist(twoDaysData$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     cex.main = 0.8, cex.lab = 0.8, cex.axis = 0.8)
# Dump plot to PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()