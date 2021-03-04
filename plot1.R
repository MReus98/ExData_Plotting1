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

# Make and save a histogram of the global active power
png("plot1.png", width = 480, height = 480)
hist(power_feb2007$Global_active_power,col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()