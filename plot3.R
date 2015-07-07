plot (data1$Sub_metering_1 ~ newdate, data=data1, type="l", xlab="", ylab="Energy sub metering", col="grey")
lines(data1$newdate, data1$Sub_metering_2, col="red")
lines(data1$newdate, data1$Sub_metering_3, col="blue")


legend("topright", pch='-', col=c("grey", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))