library(sqldf)

PowerCon <- read.csv.sql("C:/Users/HP/Documents/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";",
                         sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")


PowerCon[PowerCon == "?"] <- NA


DateTime <- as.POSIXct(paste(PowerCon$Date, PowerCon$Time), format = "%d/%m/%Y %H:%M:%S")

PowerCon <- cbind(DateTime, PowerCon)

png(file = "Plot3.png")




plot(PowerCon$DateTime, PowerCon$Sub_metering_1, type = "l", col = "black", xlab ="", ylab = "Energy sub metering")

lines(PowerCon$DateTime, PowerCon$Sub_metering_2, col = "red")

lines(PowerCon$DateTime, PowerCon$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))



dev.off()
 
