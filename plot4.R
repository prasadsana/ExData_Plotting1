#prerequisites
library("sqldf")
#Filtering and reading the file into a data frame
data <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date = '1/2/2007' or Date == '2/2/2007'",
                     sep = ";", header = TRUE)

#Added a datetime column with formatted date and time 
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")

#Opening png graphics device and plotting the graph
png("plot4.png", width = 480, height = 480, units = "px")

#settings to draw multiple plots
par(mfrow = c(2,2))

#Graph 1
plot(data$datetime,data$Global_active_power, 
     xlab = "", ylab = "Global Active Power", type = "l")

#Graph 2
plot(data$datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#Graph 3
plot(data$datetime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1))

#Graph 4
plot(data$datetime, data$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()   #closing the device