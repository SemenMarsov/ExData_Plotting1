data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
feb_data <- subset(data, (data$Date <= "2007-02-02") & (data$Date >= "2007-02-01"))
x <- feb_data$Global_active_power
png("plot1.png", width = 480, height = 480)
hist(x, xlab = "Global active power (kilowatts)", col = "red", main = "Global active power")
dev.off()
