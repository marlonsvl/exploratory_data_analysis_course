#### EXPLORATORY DATA ANALYSIS COURSE ######
#### Plot 1 ######
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

#### making a plot 1 ######
png("plot1.png", width=480, height=480)
# convert to numeric
epc_subset$Global_active_power <- as.numeric(epc_subset$Global_active_power)
hist(epc_subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()