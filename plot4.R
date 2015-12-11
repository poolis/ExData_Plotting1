plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]

par(mfrow = c(2, 2))

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_active_power, type = "n", main = "", xlab = "", ylab = "Global Active Power")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_active_power)

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Voltage, type = "n", main = "", xlab = "", ylab = "Voltage")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Voltage)

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1, type = "n", main = "", xlab = "", ylab = "Energy sub metering")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_1)
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_2, col = "red")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1), cex = 0.5, text.width = 60000, bty = "n")

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_reactive_power, type = "n", main = "", xlab = "", ylab = "Global_reactive_power")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_reactive_power)

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
