###############################

mydata <- read.csv("filtered_data.csv", header = TRUE, sep = "\t")

glob_act_pwr <- as.matrix(mydata$Global_active_power)
glob_act_pwr[glob_act_pwr=="?"] <- NA
glob_act_pwr2 <- as.numeric(glob_act_pwr)

timedate <- as.POSIXct(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(timedate, glob_act_pwr2, type="l", ylab = "Global Active Power (kilowatts)")
dev.off()