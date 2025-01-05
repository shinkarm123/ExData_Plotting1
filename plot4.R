# ... (keep all the data loading and processing code the same until the plotting section) ...

# Set up the plotting area (2x2 panel)
png("plot4.png", width = 960, height = 960)
par(mfrow = c(2, 2))

# Plot 1 (top left): Global Active Power
plot(data_filtered$DateTime, data_filtered$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     main = "")

# Plot 2 (top right): Voltage
plot(data_filtered$DateTime, data_filtered$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     main = "")

# Plot 3 (bottom left): New Sub-metering time series
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
       lty = 1,
       bty = "n")

# Plot 4 (bottom right): Global Reactive Power
plot(data_filtered$DateTime, data_filtered$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     ylim = c(0, 0.5),
     main = "")

# Close the device
dev.off()