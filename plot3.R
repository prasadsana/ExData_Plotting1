#prerequisites
library("sqldf")
#Filtering and reading the file into a data frame
data <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date = '1/2/2007' or Date == '2/2/2007'",
                     sep = ";", header = TRUE)

#Added a datetime column with formatted date and time 
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")

#Opening png graphics device and plotting the graph
png("plot3.png", width = 480, height = 480, units = "px")

plot(data$datetime, data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1), lwd = c(1,1))

dev.off()   #closing the device