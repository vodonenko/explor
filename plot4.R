# reading data from web
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip(temp, "household_power_consumption.txt")
input_data <- read.table("household_power_consumption.txt", header=T,sep=";")





# preporcessing data
working_subset <- input_data[(input_data$Date=='2/2/2007')|(input_data$Date=='1/2/2007'),]
Global_active_power <- as.numeric(as.character(working_subset$Global_active_power))
Voltage <- as.numeric(as.character(working_subset$Voltage))
Global_reactive_power <- as.numeric(as.character(working_subset$Global_reactive_power))
date_time <- strptime(paste(working_subset$Date, working_subset$Time), format="%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(working_subset$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(working_subset$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(working_subset$Sub_metering_3))


# buildin plot

png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(date_time, Global_active_power, type='l', xlab="", ylab="Global Active Power")
plot(date_time, Voltage, type='l', xlab="datetime", ylab="Voltage")

plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, Sub_metering_2, col="red")
lines(date_time, Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(date_time, Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")
dev.off()
