# By Victor Sousa - 27/03/2019
# PLOT 2

# epc = Electric power consumption

#LOADING DATA
epcdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#ADJUSTING DATE SPECIFICATION
epcdata$Date <- as.Date(epcdata$Date, format = "%d/%m/%Y")

#SUBSETING BY DATE
sub_epc <- subset(epcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#ADJUSTING DATE AND TIME
sub_epc$datetime <- strptime(paste(sub_epc$Date, sub_epc$Time), "%Y-%m-%d %H:%M:%S")
sub_epc$datetime <- as.POSIXct(sub_epc$datetime)

#PLOT 2
plot(sub_epc$Global_active_power ~ sub_epc$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#SAVING
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()