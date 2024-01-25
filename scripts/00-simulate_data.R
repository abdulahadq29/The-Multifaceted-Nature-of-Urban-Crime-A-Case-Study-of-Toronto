#### Preamble ####
# Purpose: Simulates a dataset reflecting the structure of the "Police Annual Statistical Report - Arrested and Charged Persons."
# Author: Abdul Ahad Qureshi
# Date: 25 January 2023 
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(dplyr)
library(ggplot2)

# Simulate Data
set.seed(123)  # Setting seed for reproducibility

n <- 1000  # Number of observations

# Simulating data based on the dataset structure
data <- data.frame(
  Division = sample(1:17, n, replace = TRUE),  # Assuming 17 police divisions
  Neighbourhood = sample(paste("Neighbourhood", 1:140), n, replace = TRUE),  # Assuming 140 neighbourhoods
  Sex = sample(c("Male", "Female", "Other"), n, replace = TRUE, prob = c(0.48, 0.48, 0.04)),
  Age = sample(18:70, n, replace = TRUE),  # Age range from 18 to 70
  CrimeCategory = sample(c("Theft", "Assault", "Drug Offense", "Other"), n, replace = TRUE),
  CrimeSubtype = sample(c("Subtype1", "Subtype2", "Subtype3"), n, replace = TRUE)  # Placeholder subtypes
)
# Simulating Year data
years <- seq(2010, 2020)  # Example year range
data$Year <- sample(years, n, replace = TRUE)

# Basic Data Exploration
summary(data)
table(data$Neighbourhood)
table(data$CrimeCategory)

# Visualization
# Distribution of Crime Categories
ggplot(data, aes(x = CrimeCategory, fill = CrimeCategory)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Distribution of Crime Categories")

# Analyzing Trends
# Calculating average age by year
age_trend <- data %>%
  group_by(Year) %>%
  summarize(AverageAge = mean(Age))

# Plotting the trend of age by year
ggplot(age_trend, aes(x = Year, y = AverageAge)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  theme_minimal() +
  labs(title = "Trend of Average Age by Year",
       x = "Year",
       y = "Average Age")

# Trend of Arrests by Gender
ggplot(data, aes(x = Sex, fill = Sex)) +
  geom_bar() +
  scale_fill_manual(values = c("Male" = "blue", "Female" = "red", "Other" = "green")) +
  theme_minimal() +
  labs(title = "Trend of Arrests by Gender")

