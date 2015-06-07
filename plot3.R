hpc <- read.csv2("household_power_consumption.txt")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
hpc$DateTime <- strptime(paste(as.character(hpc$Date), hpc$Time, sep=":"), format="%Y-%m-%d:%H:%M:%S")
hpc <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

plot(hpc$DateTime, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l",col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l",col="blue")
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
