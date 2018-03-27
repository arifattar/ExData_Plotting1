library(sqldf)

PowerCon <- read.csv.sql("C:/Users/HP/Documents/Coursera/ExData_Plotting1/household_power_consumption.txt", sep=";",
                         sql = "select * from file where Date == '1/2/2007' OR Date == '2/2/2007'")


PowerCon[PowerCon == "?"] <- NA

png(file = "Plot1.png")

hist(PowerCon$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()


