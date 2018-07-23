## Read the txt file, assuming it is on the Desktop (working directory)
power_data <- read.table("C:/Users/Nana Yaa B Asamoah/Desktop/household_power_consumption.txt",
                         header = T, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

## Create column in table with date and time merged together
TimeDate <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_data <- cbind(power_data, TimeDate)

## Subset data
subset_pd <- subset(power_data, Date == "1/2/2007"| Date == "2/2/2007")

##Plot TimeDate against Global Active Power
png("plot2.png", width = 480, height = 480)
with(subset_pd, plot(TimeDate, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
dev.off()