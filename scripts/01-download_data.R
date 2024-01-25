#### Preamble ####
# Purpose: Automates the process of downloading a specific dataset from the Toronto Open Data portal.
# Author: Abdul Ahad Qureshi
# Date: 25 January 2024
# Contact: ahad.qureshi@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(opendatatoronto)  # For accessing Toronto Open Data
library(tidyverse)        # For data manipulation and visualization


#### Data Retrieval Process ####
# Fetching package information for the dataset of interest
police_data_package <- opendatatoronto::show_package("police-annual-statistical-report-arrested-and-charged-persons")

# Retrieving all available resources within the package
police_data_resources <- opendatatoronto::list_package_resources("police-annual-statistical-report-arrested-and-charged-persons")

# Filtering resources to include only certain formats (CSV, GeoJSON)
valid_data_resources <- police_data_resources %>%
  dplyr::filter(tolower(format) %in% c('csv', 'geojson'))

# Obtaining the first resource from the filtered list as an example
example_arrest_data <- dplyr::filter(valid_data_resources, dplyr::row_number() == 1) %>%
  opendatatoronto::get_resource()

#### Saving the Retrieved Data ####
# Saving the downloaded data into a CSV file
# Ensure the directory 'inputs/data/' exists in your project
readr::write_csv(example_arrest_data, "inputs/data/example_arrested_persons_data.csv")
