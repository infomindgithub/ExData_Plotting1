## Manually download and extract the data in Zipfile.
## Ensure the file "household_power_consumption.txt" is in the working directory
## This is a semicolon delimited data file.
txtfile <- "household_power_consumption.txt"

#Read the data to dfpower data frame using the read.table function
#
dfpower <- read.table(txtfile, header=T, sep=";")
dfpower$Date <- as.Date(dfpower$Date, format="%d/%m/%Y")
dfpower <- dfpower[(dfpower$Date=="2007-02-01") | (dfpower$Date=="2007-02-02"),]
dfpower$Global_active_power <- as.numeric(as.character(dfpower$Global_active_power))

############################
## Plot1

hist(dfpower$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png is in", getwd())

############################
