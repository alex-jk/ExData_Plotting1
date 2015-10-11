#########################
# filter and pre-format input data
#########################
hh_power_cons_data <- read.table("household_power_consumption.txt", header=T, sep=";")

hh_power_cons_data$DateTime <- paste(hh_power_cons_data$Date, hh_power_cons_data$Time)

date_fmtd <- as.Date(hh_power_cons_data$Date, "%d/%m/%Y")

hh_power_cons_data$date_fmtd <- date_fmtd

newdata <- hh_power_cons_data[ which(hh_power_cons_data$date_fmtd>="2007-02-01" & hh_power_cons_data$date_fmtd <= "2007-02-02"), ]
write.table(newdata, "filtered_data.csv", sep="\t", row.names=FALSE)
#########################

glob_act_pwr <- as.matrix(newdata$Global_active_power)

glob_act_pwr[glob_act_pwr=="?"] <- NA
glob_act_pwr2 <- as.numeric(glob_act_pwr)

### Histogram
png("plot1.png", width = 480, height = 480)
hist(glob_act_pwr2, col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

### Save as PNG File
dev.off()
