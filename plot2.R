# Lab 1 - 
# Plot2.R

#Assumes data dir is 1 level up
saved_dir = getwd()
setwd("../data/exdata-data-household_power_consumption")

# Data folder has exdata-data-household_power_consumption
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"


data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

data1$newdate <- with (data1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

plot (data1$Global_active_power ~ newdate, data=data1, type="l", xlab="", ylab="Global Active Power (kilowatts")

# Save it
setwd(saved_dir)
dev.copy(png, file="plot2.png")
dev.off()
