# Lab 1 - 
# Plot3.R
#Assumes data dir is 1 level up
saved_dir = getwd()
setwd("../data/exdata-data-household_power_consumption")

# Data is exdata-data-household_power_consumption
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"


data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data1$newdate <- with (data1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

plot (data1$Sub_metering_1 ~ newdate, data=data1, type="l", xlab="", ylab="Energy sub metering", col="grey")
lines(data1$newdate, data1$Sub_metering_2, col="red")
lines(data1$newdate, data1$Sub_metering_3, col="blue")
legend("topright", pch='__', col=c("grey", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)

# Save it
setwd(saved_dir)
dev.copy(png, file="plot3.png")
dev.off()
