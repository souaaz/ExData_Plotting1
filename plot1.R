# Lab 1

setwd("c:/Perso/coursera/exploringdata/datasets/exdata-data-household_power_consumption")

# Data folder is in UCI HAR Dataset
datafolder <- "exdata-data-household_power_consumption"
datafile <- "household_power_consumption.txt"
# Results folder will contain output file
resultsfolder <- "results"

data = read.csv(datafile, header = TRUE, sep=";", na.strings="?")

data1 <- subset (data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# Plot it
hist(data1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
