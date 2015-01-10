# This file generates Plot 3
# The source file has been unzipped in the working directory in R

# Read the data from text file Spcifying na values as "?" 
data <- read.table("household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")
# Select data from the dates 2007-02-01 and 2007-02-02
data2days <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Load lubridate library
library(lubridate)
# Convert column date to class Date
data2days$Date <- dmy_hms(paste(data2days$Date, data2days$Time))

# Convert text to double values for submetering 1, 2 and 3
data2days$Global_active_power <- as.double(data2days$Global_active_power, length = 4)
data2days$Sub_metering_1 <- as.double(data2days$Sub_metering_1, length = 4)
data2days$Sub_metering_2 <- as.double(data2days$Sub_metering_2, length = 4)
data2days$Sub_metering_3 <- as.double(data2days$Sub_metering_3, length = 4)

# Open graphic PNG device
# Plots are generated with 480x480 pixels by default
png(file="plot3.png")

# Plot Submetering 1, 2 and 3 in the same plot for the two days with the asked parameters
with(data2days, {
        plot(Date, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(Date, Sub_metering_1, type = "l", col = "black")
        lines(Date, Sub_metering_2, type = "l", col = "red")
        lines(Date, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Close graphic devices
dev.off()

