data <- read.table("household_power_consumption.txt", sep=";", header= TRUE, stringsAsFactors=FALSE)
subData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
subData
globalActivePower <- as.numeric(subData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()