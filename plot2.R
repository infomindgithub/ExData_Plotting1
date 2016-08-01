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
# Create a new timestamp column to be able to get "day (e.g. Thu) associated with each row.
dfpower <- transform(dfpower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

############################
## Plot2

plot(dfpower$timestamp,dfpower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("plot2.png is in", getwd())
############################
