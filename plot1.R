# Plot 1
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot1.png")
hist(subset_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

