# Plot 4

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Voltage <- as.numeric(subset_data$Voltage)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)
subset_data$Global_reactive_power <- as.numeric(subset_data$Global_reactive_power)

png("plot4.png")

par(mfrow = c(2, 2))

plot(subset_data$Datetime, subset_data$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(subset_data$Datetime, subset_data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "")

plot(subset_data$Datetime, subset_data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

plot(subset_data$Datetime, subset_data$Global_reactive_power,
     type = "l",
     ylab = "Global Reactive Power",
     xlab = "Datetime")

dev.off()