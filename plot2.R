# Read in the data
columnClasses = c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric")
plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                     colClasses = columnClasses, na.strings = "?")
# Filter for the two days that are of interest
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]
# Set up the plotting area
par(mfrow = c(1, 1))
# Plot without lines
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), 
     twoDaysData$Global_active_power, type = "n", main = "", xlab = "", 
     ylab = "Global Active Power (kilowatts)", cex.lab = 0.8, cex.axis = 0.8)
# Add line for Global Active Power
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), 
      twoDaysData$Global_active_power)
# Dump plot to PNG
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()