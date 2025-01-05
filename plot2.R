# Load required libraries
library(ggplot2)

# Load the dataset
file_path <- "household_power_consumption.txt"
data <- read.table(file_path, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert Date and Time to a single DateTime object
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Day_of_Week <- weekdays(data$Date)

# Convert Global_active_power to numeric and to kilowatts
data$Global_active_power <- as.numeric(data$Global_active_power)

# Filter NA values
data <- na.omit(data)

# Filter for Thursday through Saturday
days_to_include <- c("Thursday", "Friday", "Saturday")
data_filtered <- data[data$Day_of_Week %in% days_to_include,]

# Create the time series plot
png("plot2.png", width = 480, height = 480)

# Create the plot
plot(data_filtered$DateTime, data_filtered$Global_active_power,
     type = "l",
     xlab = "Day",
     ylab = "Global Active Power (kilowatts)",
     main = "Power Usage: Thursday through Saturday")

# Add grid
grid()

dev.off()