download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
unzip("hpc.zip")
data_full<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")


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
png(filename = "plot1.png", width = 480, height = 480)
hist(main = "Global Active Power", data_work$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()  
