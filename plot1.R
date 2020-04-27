#prerequisites
library("sqldf")
#Filtering and reading the file into a data frame
data <- read.csv.sql("household_power_consumption.txt", 
                     "select * from file where Date = '1/2/2007' or Date == '2/2/2007'",
                     sep = ";", header = TRUE)

#Opening png graphics device and plotting the graph
png("plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()   #closing the device
