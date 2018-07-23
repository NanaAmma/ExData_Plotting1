## Read the txt file, assuming it is on the Desktop (working directory)
power_data <- read.table("C:/Users/Nana Yaa B Asamoah/Desktop/household_power_consumption.txt",
                         header = T, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
## Change the classes 
power_data$Date <- as.Date(power_data$Date, format = "%d/ %m/ %Y")
power_data$Time <- format(power_data$Time, format = "%H:%M:%S")

##Subset Data
subset_pd <- subset(power_data, Date == "1/2/2007"| Date == "2/2/2007")

##Plot global active power for the subset power data
png("plot1.png", width = 480, height = 480)
hist(subset_pd$Global_active_power, main = "Global Active Power",  
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")
dev.off()
