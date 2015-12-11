# Read in the data
columnClasses = c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric")
plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                     colClasses = columnClasses, na.strings = "?")
# Filter for the two days that are of interest
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]
# Set up the plotting area
par(mfrow = c(2, 2))
# Plot 1
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), 
     twoDaysData$Global_active_power, type = "n", main = "", xlab = "",
     ylab = "Global Active Power", cex.lab = 0.65, cex.axis = 0.65)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_active_power)
# Plot 2
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), 
     twoDaysData$Voltage, type = "n", main = "", xlab = "", ylab = "Voltage", 
     cex.lab = 0.65, cex.axis = 0.65)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Voltage)
# Plot 3
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1, type = "n",
     main = "", xlab = "", ylab = "Energy sub metering", 
     cex.lab = 0.65, cex.axis = 0.65)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_2, col = "red")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1), cex = 0.65, text.width = 66000, 
       bty = "n")
# Plot 4
plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
              format = "%d/%m/%Y %H:%M:%S"), 
     twoDaysData$Global_reactive_power, type = "n", main = "", xlab = "", 
     ylab = "Global_reactive_power", cex.lab = 0.65, cex.axis = 0.65)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), 
               format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_reactive_power)
# Dump plot to PNG
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
