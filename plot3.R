## Extract the data in Zipfile.
## Ensure the file "household_power_consumption.txt" is in the working directory
## This is a semicolon delimited data file.
txtfile <- "household_power_consumption.txt"
#Read the data to dfpower data frame using the read.table function
#
dfpower <- read.table(txtfile, header=T, sep=";")
dfpower$Date <- as.Date(dfpower$Date, format="%d/%m/%Y")
dfpower <- dfpower[(dfpower$Date=="2007-02-01") | (dfpower$Date=="2007-02-02"),]
# Create a new timestamp column to be able to get "day (e.g. Thu) associated with each row.
dfpower <- transform(dfpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dfpower$Sub_metering_1 <- as.numeric(as.character(dfpower$Sub_metering_1))
dfpower$Sub_metering_2 <- as.numeric(as.character(dfpower$Sub_metering_2))
dfpower$Sub_metering_3 <- as.numeric(as.character(dfpower$Sub_metering_3))

############################
## Plot3

plot(dfpower$timestamp,dfpower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfpower$timestamp,dfpower$Sub_metering_2,col="red")
lines(dfpower$timestamp,dfpower$Sub_metering_3,col="blue")
#
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the legend box        
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("plot3.png is in", getwd())
############################
