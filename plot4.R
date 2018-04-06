# Coursera - Exploratory Data Analysis - Week 1 Course Project

# Read data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subset$Date_Time <- strptime(paste(subset$Date, subset$Time), 
                             format = "%Y-%m-%d %H:%M:%S")

# Look at data
head(subset)
str(subset)

# Customize plot settings
par(mfrow = c(2,2))
par(mar=c(5,5,4,3))
par(cex = 0.5)

# Create plot 4a 
plot(subset$Date_Time, subset$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Create plot 4b
plot(subset$Date_Time, subset$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

# Create plot 4c
plot(subset$Date_Time, subset$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", col = "black")
lines(subset$Date_Time, subset$Sub_metering_2, col = "red")
lines(subset$Date_Time, subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create plot 4d
plot(subset$Date_Time, subset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")