#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Abdul Ahad Qureshi [...UPDATE THIS...]
# Date: 25 January 2023 [...UPDATE THIS...]
# Contact: ahad.qureshi@mail.utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(ggplot2)

#### Simulate data ####
set.seed(123) # Setting seed for reproducibility
n <- 1000 # Number of observations
num_neighborhoods <- 10 # Total number of neighborhoods
data <- data.frame(
  Neighborhood = factor(sample(1:num_neighborhoods, n, replace = TRUE)),
  TicketsIssued = rpois(n, lambda = 50) # Assuming Poisson distribution
)
# Basic data exploration
summary(data)
table(data$Neighborhood)

# Visualization
ggplot(data, aes(x = Neighborhood, y = TicketsIssued)) + 
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Analyzing the correlation
# Since Neighborhood is a factor, we'll use ANOVA to test for differences in ticket issuance among neighborhoods
anova_result <- aov(TicketsIssued ~ Neighborhood, data = data)
summary(anova_result)