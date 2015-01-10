# This file generates Plot 1
# The source file has been unzipped in the working directory in R

# Read the data from text file Spcifying na values as "?" 
data <- read.table("household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")
# Select data from the dates 2007-02-01 and 2007-02-02
data2days <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Load lubridate library
library(lubridate)
# Convert column date to class Date
data2days$Date <- dmy(data2days$Date)

# Convert text to double values for Global Active Power
data2days$Global_active_power <- as.double(data2days$Global_active_power, length = 4)

# Open graphic PNG device
# Plots are generated with 480x480 pixels by default
png(file="plot1.png")

# Generate Histogram with the asked parameters
hist(data2days$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

# Close graphic device
dev.off()

