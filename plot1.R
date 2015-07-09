# Lab 1 - 
# Plot1.R

#Assumes data dir is 1 level up
saved_dir = getwd()
setwd("../data/exdata-data-household_power_consumption")

# Data folder has exdata-data-household_power_consumption 
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"


data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Plot it
hist(data1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Save it
setwd(saved_dir)
dev.copy(png, file="plot1.png")
dev.off()

