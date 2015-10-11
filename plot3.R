#############################

mydata <- read.csv("filtered_data.csv", header = TRUE, sep = "\t")
timedate <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

summary(mydata$Sub_metering_1)

sub_meet1 <- mydata$Sub_metering_1
sub_meet2 <- mydata$Sub_metering_2
sub_meet3 <- mydata$Sub_metering_3

png("plot3.png", width = 480, height = 480)
plot(timedate, sub_meet1, type="l", ylab = "Energy sub metering")
lines(timedate, sub_meet2, col = "red", type = "l")
lines(timedate, sub_meet3, col = "blue", type = "l")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"), pt.cex = 10, cex=2)
dev.off()      