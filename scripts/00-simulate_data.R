#### Preamble ####
# Purpose: designed to simulate and analyze a dataset representing annual ticket issuance across various neighborhoods.
# Author: Abdul Ahad Qureshi
# Date: 25 January 2023 
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT



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