#### EXPLORATORY DATA ANALYSIS COURSE ######
#### Plot 3 ######
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

#### making a plot 3 ######
png("plot3.png", width=480, height=480)
# convert to numeric
datetime <- strptime(epc_subset$Time, "%d/%m/%Y %H:%M:%S")

epc_subset$Sub_metering_1 <- as.numeric(epc_subset$Sub_metering_1)
epc_subset$Sub_metering_2 <- as.numeric(epc_subset$Sub_metering_2)
epc_subset$Sub_metering_3 <- as.numeric(epc_subset$Sub_metering_3)

with(epc_subset, plot(datetime, Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy Sub metering"))
with(epc_subset, points(datetime, Sub_metering_1, type = "l"))
with(epc_subset, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(epc_subset, points(datetime, Sub_metering_3, type = "l", col = "blue"))
# lty = line type
# lwd = line width
legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()