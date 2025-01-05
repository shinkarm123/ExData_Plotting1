# Load the dataset
file_path <- "household_power_consumption.txt"
data <- read.table(file_path, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert Date and Time to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Convert sub metering columns to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Filter for specific dates (Feb 1-3, 2007 - Thursday through Saturday)
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-03")
data_filtered <- data[data$Date >= start_date & data$Date <= end_date,]

# Create the plot
png("plot3.png", width = 480, height = 480)

# Set up the plotting area
plot(data_filtered$DateTime, data_filtered$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering",
     ylim = c(0, max(c(data_filtered$Sub_metering_1, 
                       data_filtered$Sub_metering_2, 
                       data_filtered$Sub_metering_3), na.rm = TRUE)))

# Add the other two lines
lines(data_filtered$DateTime, data_filtered$Sub_metering_2, col = "red")
lines(data_filtered$DateTime, data_filtered$Sub_metering_3, col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = 1)

# Close the device
dev.off()