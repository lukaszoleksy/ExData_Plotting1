startReadingFrom<-66637
nRowsToUse <- 2880
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("c:/temp/household_power_consumption.txt", header = FALSE, na.strings = "?", sep=";", skip=startReadingFrom, nrows=nRowsToUse, col.names = colNames)

dateTime<- paste(data$Date, data$Time)
dateTime<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English") 

png(file="plot2.png")
plot(dateTime,data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
