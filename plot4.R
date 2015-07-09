# Lab 1 - 
# Plot4.R

#Assumes data dir is 1 level up
saved_dir = getwd()
setwd("../data/exdata-data-household_power_consumption")

# Data folder is exdata-data-household_power_consumption
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"

data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data1$newdate <- with (data1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

## Prepare for a 2 by 2 frame to show the 4 graphs
par(mfrow=c(2,2))

# Plot number 1
plot (data1$Global_active_power ~ newdate, data=data1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(data1$Voltage ~ data1$newdate, type="l", xlab="datetime", ylab="Voltage")

#Number 2
plot (data1$Sub_metering_1 ~ newdate, data=data1, type="l", xlab="", ylab="Energy sub metering", col="grey")
lines(data1$newdate, data1$Sub_metering_2, col="red")

#Number 3
lines(data1$newdate, data1$Sub_metering_3, col="blue")
# Add legend on the top right
legend("topright", pch='__', col=c("grey", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, bty="n")

#Number 4
plot (data1$Global_reactive_power ~ newdate, data=data1, type="l", xlab="datetime", ylab="Global_reactive_power", lab=c(x=3, y=6,llen=9))

# Save the picture
setwd(saved_dir)
dev.copy(png, file="plot4.png")
dev.off()
