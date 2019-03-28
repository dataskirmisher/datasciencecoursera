# By Victor Sousa - 27/03/2019
# PLOT 1

# epc = Electric power consumption

#LOADING DATA
epcdata <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#ADJUSTING DATE SPECIFICATION
epcdata$Date <- as.Date(epcdata$Date, format = "%d/%m/%Y")

#SUBSETING BY DATE
sub_epc <- subset(epcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1
hist(sub_epc$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

#SAVING
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()