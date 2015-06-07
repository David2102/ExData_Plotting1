hpc <- read.csv2("household_power_consumption.txt")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

hist(hpc$Global_active_power, main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
