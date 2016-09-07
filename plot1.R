startReadingFrom<-66637
nRowsToUse <- 2880
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("c:/temp/household_power_consumption.txt", header = FALSE, na.strings = "?", sep=";", skip=startReadingFrom, nrows=nRowsToUse, col.names = colNames)

png(file="plot1.png")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")
dev.off()
 
