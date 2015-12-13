## setting work directory
setwd(choose.dir())

## adding data source URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## download source data zip file
download.file(url, "data.zip")

## unzipping source data zip file to work directoy
unzip("data.zip")

## reading source data txt file as csv
all.data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## convert to date format
all.data$Date <- as.Date(all.data$Date, format="%d/%m/%Y")

## subset data of interest
data <- subset(all.data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## adding date and time together
date.time <- paste(as.Date(data$Date), data$Time)

## adding Date_and_time column to represent calendar dates and times
data$Date_and_time <- as.POSIXct(date.time)

## plotting data for Global Active Power
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## copying data to png file
dev.copy(png, file="plot1.png", height=480, width=480)

## stopping device
dev.off()