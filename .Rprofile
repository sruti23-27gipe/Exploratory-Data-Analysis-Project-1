setHook("rstudio.sessionInit", function(newSession) {
  if (newSession)
    message("Welcome to your Lab Sandbox! To get started, please reference the README.rd file on the right side of your screen.")
    rstudioapi::previewRd("README.rd")
}, action = "append")

options(rpubs.upload.method = "internal")


library(swirl)
swirl::install_course()
swirl()

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data,
               Date == as.Date("2007-02-01") |
                 Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

cols <- c("Global_active_power", "Global_reactive_power",
          "Voltage", "Global_intensity",
          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data[cols] <- lapply(data[cols], as.numeric)




# plot1.R

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png", width=480, height=480)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()




# plot2.R

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))
data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(data$Datetime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()




# plot3.R

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(data$Datetime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)

dev.off()



# plot4.R

data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

cols <- c("Global_active_power","Voltage","Sub_metering_1",
          "Sub_metering_2","Sub_metering_3","Global_reactive_power")

data[cols] <- lapply(data[cols], as.numeric)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data$Datetime, data$Global_active_power, type="l",
     ylab="Global Active Power")

plot(data$Datetime, data$Voltage, type="l",
     ylab="Voltage")

plot(data$Datetime, data$Sub_metering_1, type="l",
     ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

plot(data$Datetime, data$Global_reactive_power, type="l",
     ylab="Global Reactive Power")

dev.off()
