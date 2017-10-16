library(data.table)
library(lubridate)
library(dplyr)

## Loading and preparing Data

mydata = fread("~/Desktop/household_power_consumption.txt", sep = ";",
      header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

mydata$Date <- dmy(mydata$Date)

mydata <- mydata[grepl("2007-02-01", mydata$Date) | 
                     grepl("2007-02-02", mydata$Date),]

## creating a png file
png(filename = "plot1.png", width = 480, height = 480)

with(mydata, hist(Global_active_power, col = "red", main = "Global Active Power",
                  xlab = "Global Active Power (kilowatts)"))

## close the graphical device 
dev.off()

