#load data
data <- read.table("household_power_consumption.txt", header = TRUE, colClasses=c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?", sep=";")

#subset dates
datasub <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#plot to device
png(file = "plot2.png", width = 480, height = 480)

plot(datasub$datetime, datasub$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
