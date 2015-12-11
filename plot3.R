# Read in the data
columnClasses = c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric")
plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                     colClasses = columnClasses, na.strings = "?")
# Filter for the two days that are of interest
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]
# Set up the plotting area
par(mfrow = c(1, 1))
# Plot with no lines
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), 
     twoDaysData$Sub_metering_1, type = "n", main = "", xlab = "", 
     ylab = "Energy sub metering", cex.lab = 0.8, cex.axis = 0.8)
# Add line for Sub_metering_1
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time),
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1)
# Add line for Sub_metering_2
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_2, col = "red")
# Add line for Sub_metering_3
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_3, col = "blue")
# Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1), cex = 0.75, text.width = 48000)
# Dump plot to PNG
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()