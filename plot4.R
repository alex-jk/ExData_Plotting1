###################################

mydata <- read.csv("filtered_data.csv", header = TRUE, sep = "\t")
timedate <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

voltage <- mydata$Voltage
summary(voltage)

glob_react_pwr <- mydata$Global_reactive_power

glob_act_pwr <- as.matrix(mydata$Global_active_power)
glob_act_pwr[glob_act_pwr=="?"] <- NA
glob_act_pwr2 <- as.numeric(glob_act_pwr)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
par(mar = rep(2, 4))
plot(timedate, glob_act_pwr2, type="l", ylab = "Global Active Power (kilowatts)")
plot(timedate, voltage, type="l", ylab = "Voltage")
plot(timedate, mydata$Sub_metering_1, type="l", ylab = "Energy sub metering")
lines(timedate, mydata$Sub_metering_2, col = "red", type = "l")
lines(timedate, mydata$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"), pt.cex = 3, cex=.5)
plot(timedate, glob_react_pwr, type = "l", ylab = "Global Reactive Power")
dev.off()