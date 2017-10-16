library(data.table)
library(lubridate)
library(dplyr)

## Loading and preparing Data

mydata = fread("~/Desktop/household_power_consumption.txt", sep = ";",
               header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

mydata$Date <- dmy(mydata$Date)

mydata <- mydata[grepl("2007-02-01", mydata$Date) | 
                     grepl("2007-02-02", mydata$Date),]

timevariable <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

## creating a png file
png(filename = "plot3.png", width = 480, height = 480)

# making a plot
plot(timevariable, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(timevariable, mydata$Sub_metering_2, col = "red")
lines(timevariable, mydata$Sub_metering_3, col = "blue")
# add legend
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

## close the graphical device 
dev.off()

