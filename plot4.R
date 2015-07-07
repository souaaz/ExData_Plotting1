setwd("c:/Perso/coursera/exploringdata/datasets/exdata-data-household_power_consumption")

# Data folder is in UCI HAR Dataset
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"
# Results folder will contain output file
resultsfolder <- "results"

data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data1$newdate <- with (data1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

par(mfrow=c(2,2))
# Plot it
plot (data1$Global_active_power ~ newdate, data=data1, type="l", xlab="", ylab="Global Active Power (kilowatts")

plot(data1$Voltage ~ data1$newdate, xlab="Voltage")

plot (data1$Sub_metering_1 ~ newdate, data=data1, type="l", xlab="", ylab="Energy sub metering", col="grey")
lines(data1$newdate, data1$Sub_metering_2, col="red")
lines(data1$newdate, data1$Sub_metering_3, col="blue")
legend("topright", pch='-', col=c("grey", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot (data1$Global_reactive_power ~ newdate, data=data1, type="l", xlab="", ylab="Global_reactive_power")

