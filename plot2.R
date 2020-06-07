## This function unzips the household_power_consumption.txt and plots 

power <- "C:/Users/Shane/Downloads/exdata_data_household_power_consumption.zip"
unzip(power)
powerTxt <- "C:/Users/Shane/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"
powerData <- read.table(powerTxt, skip = 1, sep = ";")
names(powerData) <- c("Date", 
                      "Time",
                      "Global_active_power",
                      "Global_reactive_power",
                      "Voltage",
                      "Global_intensity",
                      "Sub_metering_1",
                      "Sub_metering_2",
                      "Sub_metering_3")
powerDate <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")
powerDate$Date <- as.Date(powerDate$Date, format = "%d/%m/%Y")
powerDate$Time <- strptime(powerDate$Time, format = "%H:%M:%S")
powerDate$Global_active_power <- as.numeric(powerDate$Global_active_power)

## Opening png for plot2
png("./data/plot2.png", width = 480, height = 480)
powerDate[1:1440, "Time"] <- format(powerDate[1:1440, "Time"], "2007/02/01 %H:%M:%S")
powerDate[1441:2880, "Time"] <- format(powerDate[1441:2880, "Time"], "2007/02/02 %H:%M:%S")
plot(powerDate$Time, powerDate$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)")
dev.off()