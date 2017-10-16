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
png(filename = "plot2.png", width = 480, height = 480)

plot(timevariable, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close the graphical device 
dev.off()

