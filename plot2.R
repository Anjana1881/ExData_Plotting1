setwd("C:/Users/Anjana/OneDrive - Degnon Associates, Inc/Documents/R/exdata_data_household_power_consumption")

#Read in data
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", as.is=TRUE)

#format date
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

#format time
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%Y-%m-%d %H:%M:%S")

#subset data for 2-1-2006 to 2-2-2006
powerhw <- subset(power, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
head(powerhw)

#Open PNG file
png("plot2.png", width = 480, height = 480)

#Create plot
plot(powerhw$DateTime, powerhw$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()