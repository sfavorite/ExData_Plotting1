library(dplyr)
data <- read.table("household_power_consumption.txt", sep=";", na.strings="?",  header=TRUE)
subsetted <- filter(data, Date == "2/2/2007" | Date == "1/2/2007")
subsetted$Date <- strptime(paste(subsetted$Date, subsetted$Time), format = "%d/%m/%Y %H:%M:%S")
png("plot1.png")
with(subsetted, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
graphics.off()
