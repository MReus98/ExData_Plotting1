# Read the electrical power consumption data into R
power_consumption <- read.table("household_power_consumption.txt", header=TRUE,
                                sep=";", na.strings="?")

# Convert the dates and times to a date-time class
power_consumption$DateTime <-  paste(power_consumption$Date, power_consumption$Time, 
                                     sep=" ")
power_consumption$DateTime <- strptime(power_consumption$DateTime, 
                                       format="%d/%m/%Y %H:%M:%S")

# Select 2007-02-01 and 2007-02-02
power_feb2007 <- subset(power_consumption, power_consumption$Date=="1/2/2007"
                        | power_consumption$Date =="2/2/2007")


old.loc <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English") 

# Make a plot of multiple graphs of a variable (global active power, voltage, 
# energy sub metering, and global reactive power) versus time
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Global active power versus time
plot(power_feb2007$DateTime, power_feb2007$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
# Voltage versus time
plot(power_feb2007$DateTime, power_feb2007$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
# Energy sub metering versus time
plot(power_feb2007$DateTime, power_feb2007$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering")
lines(power_feb2007$DateTime, power_feb2007$Sub_metering_2, col="red")
lines(power_feb2007$DateTime, power_feb2007$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n")
# Global reactive power versus time
plot(power_feb2007$DateTime, power_feb2007$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")
dev.off()

