library(dplyr)
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",  header=TRUE)
subsetted <- filter(data, Date == "2/2/2007" | Date == "1/2/2007")
subsetted$Date <- strptime(paste(subsetted$Date, subsetted$Time), format = "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
with(subsetted, plot(Date, Global_active_power, type = "l", xlab="", ylab="Global Active Power"))
par(new=F)
with(subsetted, plot(Date, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
par(new=F)
with(subsetted, plot(Date, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
par(new=T)
with(subsetted, lines(Date, Sub_metering_2, col="red", type = "l", xlab="", ylab=""))
par(new=T)
with(subsetted, lines(Date, Sub_metering_3, col="blue", type = "l", xlab = "", ylab = ""))
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'), cex=.8)
with(subsetted, plot(Date, Global_reactive_power, type = "l", xlab="datetime", ylab="Global reactive power"))
graphics.off()
