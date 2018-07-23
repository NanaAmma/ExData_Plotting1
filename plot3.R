## Read the txt file, assuming it is on the Desktop (working directory)
power_data <- read.table("C:/Users/Nana Yaa B Asamoah/Desktop/household_power_consumption.txt",
                         header = T, na.strings = "?", sep = ";", stringsAsFactors = FALSE)

## Create column in table with date and time merged together
TimeDate <- strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_data <- cbind(power_data, TimeDate)

## Subset data
subset_pd <- subset(power_data, Date == "1/2/2007"| Date == "2/2/2007")

## Plot Submetering against TimeDate
png("plot3.png", width = 480, height = 480)
with(subset_pd, plot(TimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subset_pd$TimeDate, subset_pd$Sub_metering_2,type="l", col= "red")
lines(subset_pd$TimeDate, subset_pd$Sub_metering_3,type="l", col= "blue")
#create legend
legend("topright", col = c("Black", "Red", "Blue"), legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)
dev.off()