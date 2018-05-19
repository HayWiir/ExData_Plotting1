data_full <- read.csv('household_power_consumption.csv',sep = ';', na.strings = '?')

#Convert Date to Date format
data_full$Date <- as.Date(data_full$Date, "%d/%m/%Y")

#Get working dataset
data_work <- subset(data_full, (Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02')))

#Convert Date and Time to Date/Time format
x1 <- strptime(paste(data_work$Date,data_work$Time), "%Y-%m-%d %H:%M:%S")
data_work$Date <- NULL
data_work$Time <- NULL
data_work$DateTime <- x1

#Plotting
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(data_work$DateTime, data_work$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")

plot(data_work$DateTime, data_work$Voltage, type = 'l', xlab = "datetime", ylab = "Volage")


plot(data_work$DateTime, data_work$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy Sub Metering")
par(new=TRUE)
plot(data_work$DateTime, data_work$Sub_metering_2, type = 'l', col = 'red', xlab="", ylab="", ylim = c(0,38))
par(new=TRUE)
plot(data_work$DateTime, data_work$Sub_metering_3, type = 'l', col = 'blue', xlab="", ylab="", ylim = c(0,38))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"), lty =1, cex = 1, bty = "n")


plot(data_work$DateTime, data_work$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()




