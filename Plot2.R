library(sqldf)

PowerCon <- read.csv.sql("C:/Users/HP/Documents/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";",
                         sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")


PowerCon[PowerCon == "?"] <- NA


DateTime <- as.POSIXct(paste(PowerCon$Date, PowerCon$Time), format = "%d/%m/%Y %H:%M:%S")

PowerCon <- cbind(DateTime, PowerCon)

png(file = "Plot2.png")

with(PowerCon, plot(DateTime, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)"))

 
dev.off()