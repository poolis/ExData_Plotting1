plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
twoDaysData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007",]

par(mfrow = c(1, 1))

hist(twoDaysData$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()