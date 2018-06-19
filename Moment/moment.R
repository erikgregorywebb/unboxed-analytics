
library("rjson")
library("ggplot2")
library("ggthemes")
library("gridExtra")
library("caret")
library("dplyr")

### DATA CLEANING ###
json_file = "/Users/erikgregorywebb/Documents/Unboxed-Analytics/Moment/moment.json"
json_data <- fromJSON(file=json_file)
  
df <- lapply(json_data, function(days) # Loop through each "play"
{
  # Convert each group to a data frame.
  # This assumes you have 6 elements each time
  data.frame(matrix(unlist(days), ncol=3, byrow=T))
})
  
# Now you have a list of data frames, connect them 
# together in one single dataframe
moment <- do.call(rbind, df)

# Make column names nicer, remove row names
colnames(moment) <- c("minuteCount", "pickupCount", "Date")
rownames(moment) <- NULL

# Clean and correctly format variables
moment$minuteCount <- as.numeric(as.character(moment$minuteCount))
moment$pickupCount <- as.numeric(as.character(moment$pickupCount))
moment$Date <- substr(moment$Date, 0, 10)
moment$Date <- as.Date(moment$Date, "%Y-%m-%d")

### FEATURE ENGINEERING ###
moment$DOW <- weekdays(moment$Date)
moment$DOW <- as.factor(moment$DOW)

# Export the cleaned dataset
write.csv(moment, file = "/Users/erikgregorywebb/Documents/Unboxed-Analytics/Moment/moment.csv")

### DATA VISUALIZATION ###
setwd("/Users/erikgregorywebb/Documents/Unboxed-Analytics/Moment/plots")

# Distributions of screen time minutes and phone pickups
g1 <- ggplot(moment, aes(x = minuteCount)) +
  geom_density(alpha=.2, fill="blue") +
  labs(title = "Screen Time Minutes",
       x = "Minutes",
       y = "Density") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5))

g2 <- ggplot(moment, aes(x = pickupCount)) +
  geom_density(alpha=.2, fill="red") +
  labs(title = "Phone Pickups",
       x = "Pickups",
       y = "Density") +
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(g1, g2, ncol=2)
g3 <- arrangeGrob(g1, g2, ncol=2)
ggsave(file = "dist.png", g3, width = 9, height = 4.5, dpi = 320)

# Usage trend over time
g4 <- ggplot(moment, aes(x = Date, y = minuteCount)) +
  geom_line() +
  geom_smooth(se = FALSE) +
  labs(title = "Screen Minutes Over Time ",
       x = "Date",
       y = "Minutes") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

g5 <- ggplot(moment, aes(x = Date, y = pickupCount)) +
  geom_line() +
  geom_smooth(se = FALSE) +
  labs(title = "Phone Pickups Over Time ",
       x = "Date",
       y = "Pickups") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(g4, g5, nrow=2)
g6 <- arrangeGrob(g4, g5, nrow=2)
ggsave(file = "trend.png", g6, width = 9, height = 4.5, dpi = 320)

# Remove the noise and plot average usage over time by month
moment$monyr <- as.factor(paste(format(moment$Date, "%Y"), format(moment$Date, "%m"), "01", sep = "-"))

bymonth <- moment %>%
  group_by(monyr) %>%
  summarise(avg_minute = mean(minuteCount),
            avg_pickup = mean(pickupCount)) %>%
  filter(avg_minute > 50) %>% # used to remove the outlier for July 2017
  arrange(monyr)

bymonth$monyr <- as.Date(as.character(bymonth$monyr), "%Y-%m-%d")

g7 <- ggplot(bymonth, aes(x = monyr, y = avg_minute)) + 
  geom_line(col = "grey") + 
  geom_smooth(se = FALSE) + 
  ylim(90, 170) + 
  labs(title = "Average Screen Time by Month",
       x = "Date",
       y = "Minutes") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

g8 <- ggplot(bymonth, aes(x = monyr, y = avg_pickup)) + 
  geom_line(col = "grey") + 
  geom_smooth(se = FALSE) + 
  ylim(30, 70) + 
  labs(title = "Average Phone Pickups by Month",
       x = "Date",
       y = "Pickups") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(g7, g8, nrow=2)
g9 <- arrangeGrob(g7, g8, nrow=2)
ggsave(file = "month-trend.png", g9, width = 9, height = 4.5, dpi = 320)

# Analyze usage metrics by day of week

byDOW <- moment %>%
  group_by(DOW) %>%
  summarise(avg_minute = mean(minuteCount),
            avg_pickup = mean(pickupCount)) %>%
  arrange(desc(avg_minute))

g10 <- ggplot(byDOW, aes(x = reorder(DOW, -avg_minute), y = avg_minute)) + 
  geom_bar(stat = "identity", alpha = .4, fill = "blue", colour="black") +
  labs(title = "Average Screen Time by DOW",
       x = "",
       y = "Minutes") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

g11 <- ggplot(byDOW, aes(x = reorder(DOW, -avg_pickup), y = avg_pickup)) + 
  geom_bar(stat = "identity", alpha = .4, fill = "red", colour="black") +
  labs(title = "Average Phone Pickups by DOW",
       x = "",
       y = " Pickups") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

grid.arrange(g10, g11, ncol=2)
g12 <- arrangeGrob(g10, g11, ncol=2)
ggsave(file = "DOW.png", g12, width = 9, height = 4.5, dpi = 320)

### DATA MODELING
fit <- lm(minuteCount ~ pickupCount, data = moment)
summary(fit)

g13 <- ggplot(moment, aes(x = pickupCount, y = minuteCount)) + 
  geom_point(alpha = .6) + 
  geom_smooth(method = 'lm', formula = y ~ x, se = FALSE) +
  #geom_bar(stat = "identity", alpha = .4, fill = "blue", colour="black") +
  labs(title = "Minutes of Screen Time vs Phone Pickups",
       x = "Phone Pickups",
       y = "Minutes of Screen Time") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

ggsave(file = "scatter.png", g13, width = 9, height = 4.5, dpi = 320)

# Create dashboard images
grid.arrange(g4, g5, g7, g8, nrow = 2, ncol = 2)
grid.arrange(g1, g2, g10, g11, nrow = 2, ncol = 2)


