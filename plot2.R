
data1$newdate <- with (data1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

plot (data1$Global_active_power ~ newdate, data=data1, type="l", xlab="", ylab="Global Active Power (kilowatts")
