
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
png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")
hist(as.numeric(as.character(hpcSel$Global_active_power)),col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
