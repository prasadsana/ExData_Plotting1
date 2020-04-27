#prerequisites
library("sqldf")
#Filtering and reading the file into a data frame
data <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date = '1/2/2007' or Date == '2/2/2007'",
                     sep = ";", header = TRUE)

#Added a datetime column with formatted date and time 
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%e/%m/%Y %H:%M:%S")

#Opening png graphics device and plotting the graph
png("plot2.png", width = 480, height = 480, units = "px")

plot(data$datetime,data$Global_active_power, 
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()   #closing the device