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
par(mar=c(5,5,4,3))
par(cex = 0.7)

# Create plot 2
plot(subset$Date_Time, subset$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
