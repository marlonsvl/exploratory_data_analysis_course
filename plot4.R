#### EXPLORATORY DATA ANALYSIS COURSE ######
#### Plot 4 ######
setwd("/Users/marlonvinan/Documents/Doctorado/Exploratory_data_analysis_course/project1")
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
                  , stringsAsFactors = FALSE, dec = ".")
#### concatening date and time
epc$Time <- paste(epc$Date, epc$Time, sep = " ")
# convert column Date(character) to class Date
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
# to know column's classes from dataset
lapply(epc, class)

epc_subset <- subset(epc, epc$Date >= as.Date("2007-02-01") & epc$Date <= as.Date("2007-02-02"))

epc_subset$Global_active_power <- as.numeric(epc_subset$Global_active_power)
epc_subset$Global_reactive_power <- as.numeric(epc_subset$Global_reactive_power)
epc_subset$Voltage <- as.numeric(epc_subset$Voltage)
datetime <- strptime(epc_subset$Time, "%d/%m/%Y %H:%M:%S")
epc_subset$Sub_metering_1 <- as.numeric(epc_subset$Sub_metering_1)
epc_subset$Sub_metering_2 <- as.numeric(epc_subset$Sub_metering_2)
epc_subset$Sub_metering_3 <- as.numeric(epc_subset$Sub_metering_3)

#### making a plot 4 ######
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

with(epc_subset, {
  plot(datetime, epc_subset$Global_active_power, type = "l", xlab = "",
       ylab = "Global Active Power (kilowatts)")
  plot(datetime, epc_subset$Voltage, type = "l", xlab = "datetime",
       ylab = "Voltage")
  plot(datetime, Sub_metering_1, type = "n", xlab = "",
       ylab = "Energy Sub metering")
  points(datetime, Sub_metering_1, type = "l")
  points(datetime, Sub_metering_2, type = "l", col = "red")
  points(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, epc_subset$Global_reactive_power, type = "l", xlab = "datetime",
       ylab = "Global Reactive Power (kilowatts)")
})

dev.off()