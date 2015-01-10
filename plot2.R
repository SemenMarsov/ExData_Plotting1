data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
feb_data <- subset(data, (data$Date <= "2007-02-02") & (data$Date >= "2007-02-01"))
feb_data$DateTime <- paste(feb_data$Date, feb_data$Time)
feb_data$DateTime <- strptime(feb_data$DateTime, format = "%Y-%m-%d %H:%M:%S")
x <- feb_data$Global_active_power
Sys.setlocale("LC_TIME", "English")
png("plot2.png", width = 480, height = 480)
plot(feb_data$DateTime, x, ylab = "Global Active Power (kilowatts)", xlab = "", pch = ".")
lines(feb_data$DateTime, x)
dev.off()

