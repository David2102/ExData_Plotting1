hpc <- read.csv2("household_power_consumption.txt")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$DateTime <- strptime(paste(as.character(hpc$Date), hpc$Time, sep=":"), format="%Y-%m-%d:%H:%M:%S")
hpc <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

plot(hpc$DateTime, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()

