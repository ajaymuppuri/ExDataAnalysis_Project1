data <- read.table("household_power_consumption.txt", sep=";", header= TRUE, stringsAsFactors=FALSE)
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
subData
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
datetime<-strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subData$Global_active_power)
voltage <- as.numeric(subData$Voltage)
globalReactivePower <- as.numeric(subData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy Sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, bty="n", border="white", col=c("black", "red", "blue"))

plot(datetime, voltage, type="l", ylab="Voltage")

plot(datetime, globalReactivePower, type="l", ylab="Global_Reactive_Power")

dev.off()