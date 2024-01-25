library(tidyverse)
library(dplyr)
pop_data = read_csv("C:/Users/33751/Desktop/data science/download file/Population2011_1656567141570.csv")
View(pop_data)

# Cleaning the merged dataset
# Remove duplicate rows
clean_data <- distinct(pop_data)

# Handling missing values
# This can vary depending on your specific needs, for example:
# Removing rows with any missing value
clean_data <- na.omit(pop_data)

write_csv(clean_data, "C:/Users/33751/Desktop/data science/Clean_population.csv")

sort(clean_data$Postcode)
