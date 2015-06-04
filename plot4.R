
library(dplyr)
library(datasets)

# Reading data file
hpcData <- read.table("./data/household_power_consumption.txt", header = T, sep=";")

# Converting Date to date format in new column
hpcData$nDate <- as.Date(hpcData[,"Date"],"%d/%m/%Y")

# Filtering 
hpcSel <- filter(hpcData, nDate >= "2007-02-01" & nDate <= "2007-02-02")
hpcSel$DateTime <- strptime(paste(hpcSel[,"Date"],hpcSel[,"Time"]), "%d/%m/%Y %H:%M:%S")

# Creating graphics and saving in png file
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2),mar=c(4,4,2,2))
with(hpcSel, {
        plot(DateTime, as.numeric(as.character(Global_active_power)), type = "l",ylab = "Global Active Power (kilowatts)",xlab="")
        plot(DateTime, as.numeric(as.character(Voltage)), type = "l",ylab = "Voltage",xlab="datetime")
        plot(DateTime, as.numeric(as.character(Sub_metering_1)), type = "n", ylab = "Energy sub metering",xlab="")
        points(DateTime, as.numeric(as.character(Sub_metering_1)), type = "l")
        points(DateTime, as.numeric(as.character(Sub_metering_2)), type = "l", col="red")
        points(DateTime, as.numeric(as.character(Sub_metering_3)), type = "l", col="blue")
        legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty = "n")        
        plot(DateTime, as.numeric(as.character(Global_reactive_power)), type = "l",ylab = "Global_reactive_power",xlab="datetime")
})
dev.off()
