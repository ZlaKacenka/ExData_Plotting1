#load data
data <- read.table("household_power_consumption.txt", header = TRUE, colClasses=c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?", sep=";")

#subset dates
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#plot to device
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(datasub, {
  plot(datasub$datetime, datasub$Global_active_power, type="l",ylab="Global Active Power",xlab="")
  
  plot(datasub$datetime, datasub$Voltage, type="l",ylab="Voltage",xlab="datetime")
  
  plot(datasub$datetime, datasub$Sub_metering_1, type = "n", ylab="Energy sub metering",,xlab="")
  lines(datasub$datetime, datasub$Sub_metering_1, col= "black")
  lines(datasub$datetime, datasub$Sub_metering_2, col= "red")
  lines(datasub$datetime, datasub$Sub_metering_3, col= "blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
  
  plot(datasub$datetime, datasub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})

dev.off()