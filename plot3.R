plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]

par(mfrow = c(1, 1))

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1, type = "n", main = "", xlab = "", ylab = "Energy sub metering")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_2, col = "red")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1), cex = 0.75, text.width = 50000)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()