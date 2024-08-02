install_if_missing <- function(package) {
  if (!require(package, character.only = TRUE)) {
    install.packages(package, dependencies = TRUE)
  }
}

# Check and install required packages
install_if_missing("readxl")
install_if_missing("httr")
install_if_missing("tidyverse")

# Load the packages
library(readxl)
library(httr)
library(tidyverse)

# Define the URL of the Excel file on GitHub
url <- "https://github.com/HPCurtis/Datasets/raw/main/grocery_database.xlsx"

# Use httr to download the file
GET(url, write_disk(tf <- tempfile(fileext = ".xlsx")))

# List all sheets in the workbook
sheets <- excel_sheets(tf)

# Read the Excel file
customer_details <- read_excel(tf, sheet = sheets[1])
# Create a data set with no missing data
cd_nafree <- drop_na(cusotmer_details)

# Descriptive statistics 
female_males_credit_score <- cd_nafree |>
  group_by(gender) |> summarise(Average = mean(credit_score, na.rm = TRUE),
                                SE = sd(credit_score, na.rm = TRUE) / sqrt(n() ))

# change the Colum values for better plotting.
female_males_credit_score$gender <- ifelse(female_males_credit_score$gender == "F", "Female", "Male")

# Basic histogram plots for 
cd_nafree[cd_nafree$gender == "F", "credit_score"]

# Plot the distribution of female credit scores. 
ggplot(cd_nafree[cd_nafree$gender == "F", ], aes(x = credit_score)) +
  geom_histogram(fill = "skyblue", color = "white") +
  labs(title = "Histogram of Credit Scores for Females",
       x = "Credit Score",
       y = "Frequency") +
  theme_minimal()

# Plot the distribution of female credit scores. 
ggplot(cd_nafree[cd_nafree$gender == "M", ], aes(x = credit_score)) +
  geom_histogram(fill = "skyblue", color = "white") +
  labs(title = "Histogram of Credit Scores for Males",
       x = "Credit Score",
       y = "Frequency") +
  theme_minimal()

# Plot the credit score using barplot to make visual comparison.
ggplot(female_males_credit_score, aes(x = gender, y = Average, fill = gender)) +
  geom_bar(stat = "identity") +
  # plot CI bars to plot  
  geom_errorbar(aes(ymin = Average - 1.96 * SE, ymax = Average + 1.96 * SE), width = 0.2) +
  labs(title = "Average Credit Score by Gender", 
                                     x = "Gender", 
                                     y = "Average Credit Score") +
  scale_fill_manual(values = c("Female" = "red", "Male" = "blue"))
