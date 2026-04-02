# Plot 2

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot2.png")
plot(subset_data$Datetime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()