## Extract the data in Zipfile.
## Ensure the file "household_power_consumption.txt" is in the working directory
## This is a semicolon delimited data file.
txtfile <- "household_power_consumption.txt"
#Read the data to dfpower data frame using the read.table function
#
dfpower <- read.table(txtfile, header=T, sep=";")
dfpower$Date <- as.Date(dfpower$Date, format="%d/%m/%Y")
dfpower <- dfpower[(dfpower$Date=="2007-02-01") | (dfpower$Date=="2007-02-02"),]
dfpower$Global_active_power <- as.numeric(as.character(dfpower$Global_active_power))
dfpower$Global_reactive_power <- as.numeric(as.character(dfpower$Global_reactive_power))
dfpower$Voltage <- as.numeric(as.character(dfpower$Voltage))
## Add a timestamp column to be able to extract the three letter day (e.g. "Thu") associated with data rows.
dfpower <- transform(dfpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dfpower$Sub_metering_1 <- as.numeric(as.character(dfpower$Sub_metering_1))
dfpower$Sub_metering_2 <- as.numeric(as.character(dfpower$Sub_metering_2))
dfpower$Sub_metering_3 <- as.numeric(as.character(dfpower$Sub_metering_3))

############################
## Plot4

par(mfrow=c(2,2), mar = c(1, 1, 1, 1), oma = c(0, 0, 0, 0))

##---Group Plot 1
plot(dfpower$timestamp,dfpower$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##---Group Plot 2
plot(dfpower$timestamp,dfpower$Voltage, type="l", xlab="datetime", ylab="Voltage")

##---Group Plot 3
plot(dfpower$timestamp,dfpower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfpower$timestamp,dfpower$Sub_metering_2,col="red")
lines(dfpower$timestamp,dfpower$Sub_metering_3,col="blue")
#
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
#---Group Plot 4
plot(dfpower$timestamp,dfpower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Create PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png is in", getwd())

############################
