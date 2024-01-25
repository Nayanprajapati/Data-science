library(tidyverse)
library(dplyr)
data_f1 = read_csv("C:/Users/33751/Desktop/data science/download file/pp-2019.csv")
data_f2 = read_csv("C:/Users/33751/Desktop/data science/download file/pp-2020.csv")
data_f3 = read_csv("C:/Users/33751/Desktop/data science/download file/pp-2021.csv")
data_f4 = read_csv("C:/Users/33751/Desktop/data science/download file/pp-2022.csv")

colnames(data_f1) <- c("Transaction_Unique_Identifier","Price","Date_of_Transfer","PostCode","Property_Type","New_Building","Leasehold_Freehold","Locality","SAON","Street","Village","Town","District","County","Energy_Rating","EPC")
colnames(data_f2) <- c("Transaction_Unique_Identifier","Price","Date_of_Transfer","PostCode","Property_Type","New_Building","Leasehold_Freehold","Locality","SAON","Street","Village","Town","District","County","Energy_Rating","EPC")
colnames(data_f3) <- c("Transaction_Unique_Identifier","Price","Date_of_Transfer","PostCode","Property_Type","New_Building","Leasehold_Freehold","Locality","SAON","Street","Village","Town","District","County","Energy_Rating","EPC")
colnames(data_f4) <- c("Transaction_Unique_Identifier","Price","Date_of_Transfer","PostCode","Property_Type","New_Building","Leasehold_Freehold","Locality","SAON","Street","Village","Town","District","County","Energy_Rating","EPC")

merged_data = rbind(data_f1,data_f2,data_f3,data_f4)
View(merged_data)

# Cleaning the merged dataset
# Remove duplicate rows
merged_data <- distinct(merged_data)

# Handling missing values
# This can vary depending on your specific needs, for example:
# Removing rows with any missing value
merged_data <- na.omit(merged_data)

# Export the cleaned, combined dataset to a new CSV file
write_csv(merged_data, "C:/Users/33751/Desktop/data science/Clean_Housing.csv")

final_data = read_csv("/Users/33751/Desktop/data science/Clean_Housing.csv")
View(final_data)

merged_data = merged_data %>% 
  filter(County %in% c("KENT","SURREY"))


colnames(final_data)


# Rank towns based on lowest average property prices
top_towns_lowest_price <- final_data %>%
  group_by(Town) %>%
  summarize(Average_Price = mean(Price, na.rm = TRUE)) %>%
  arrange(Average_Price) %>%
  head(10)

# Display the top ten towns with lowest average prices
print(top_towns_lowest_price)



sort(final_data$PostCode)






