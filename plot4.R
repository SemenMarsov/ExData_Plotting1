data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
feb_data <- subset(data, (data$Date <= "2007-02-02") & (data$Date >= "2007-02-01"))
feb_data$DateTime <- paste(feb_data$Date, feb_data$Time)
feb_data$DateTime <- strptime(feb_data$DateTime, format = "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

with(feb_data, {
plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab = "", pch = ".", type = "l")
plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", pch = ".", type = "l")
	
	#third graph
{plot(DateTime, Sub_metering_1, pch = ".", type = "l", 
xlab = "", ylab = "Energy sub metering")
points(DateTime, Sub_metering_2, pch = ".", col = "red")
lines(DateTime, Sub_metering_2, col = "red")
points(DateTime, Sub_metering_3, pch = ".", col = "blue")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
lty = c(1,1), lwd = c(2.5, 2.5), bty = "n")
}
	#fourth graph
plot(DateTime, Global_reactive_power, ylab = "Global reactive power", xlab = "datetime", pch = ".", type = "l")
})	
dev.off()

