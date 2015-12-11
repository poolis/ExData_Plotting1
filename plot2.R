plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]

par(mfrow = c(1, 1))

plot(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_active_power, type = "n", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(strptime(paste(twoDaysData$Date, " ", twoDaysData$Time), format = "%d/%m/%Y %H:%M:%S"), twoDaysData$Global_active_power)
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()