startReadingFrom<-66637
nRowsToUse <- 2880
colNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- read.table("c:/temp/household_power_consumption.txt", header = FALSE, na.strings = "?", sep=";", skip=startReadingFrom, nrows=nRowsToUse, col.names = colNames)

datetime<- paste(data$Date, data$Time)
datetime<-strptime(datetime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English") 

png(file="plot4.png")

par(mfrow=c(2,2))

plot(dateTime,data$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

plot(dateTime,data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(datetime,data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="Black")
lines(datetime,data$Sub_metering_2, col="Red")
lines(datetime,data$Sub_metering_3, col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"))


plot(dateTime,data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power",  ylim=c(0.0,0.5), tck=0.1)

dev.off()


