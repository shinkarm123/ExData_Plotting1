# Load required libraries
library(ggplot2)

# Load the dataset
file_path <- "household_power_consumption.txt"
data <- read.table(file_path, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Remove NA values
data <- na.omit(data)

# Create a bar graph
ggplot(data, aes(x = Global_active_power)) +
  geom_bar(fill = "blue", color = "black") +
  labs(title = "Frequency of Global Active Power",
       x = "Global Active Power (kilowatts)",
       y = "Frequency") +
  theme_minimal()

# Save the plot to a file
ggsave("plot1.png")
