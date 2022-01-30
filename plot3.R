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
png("plot3.png", width = 480, height = 480)

#Create plot
plot(powerhw$DateTime, powerhw$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col = "black")
lines(powerhw$DateTime, powerhw$Sub_metering_2, type= "l", col = "red")
lines(powerhw$DateTime, powerhw$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()