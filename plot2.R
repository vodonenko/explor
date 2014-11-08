# reading data from web

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
unzip(temp, "household_power_consumption.txt")
input_data <- read.table("household_power_consumption.txt", header=T,sep=";")

# preporcessing data
working_subset <- input_data[(input_data$Date=='2/2/2007')|(input_data$Date=='1/2/2007'),]
Global_active_power <- as.numeric(as.character(working_subset$Global_active_power))
date_time <- strptime(paste(working_subset$Date, working_subset$Time), format="%d/%m/%Y %H:%M:%S")


png(file="plot2.png", width = 480, height = 480)
plot(date_time, Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
date_time <- strptime(paste(working_subset$Date, working_subset$Time), format="%d/%m/%Y %H:%M:%S")
