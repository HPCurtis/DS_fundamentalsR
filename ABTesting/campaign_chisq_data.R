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
campaign_data <- read_excel(tf, sheet = sheets[4])

# Calculate sign up rate.
mailer1_signup_rate <- 123 / (252 + 123)
mailer2_signup_rate <- 127 / (209 + 127)
print(c(mailer1_signup_rate, mailer2_signup_rate))

# genaret crosstabel of the campaign data.
observed_values <- campaign_data %>%
  count(mailer_type, signup_flag)  %>%
  spread(signup_flag, n)

observed_values <- as.data.frame(observed_values)
# Set the 'mailertype' column as row names
rownames(observed_values) <- observed_values$mailer_type

# Remove the 'ID' column if it's no longer needed in the dataframe
observed_values <- observed_values[, c(2,3)]

# Results of chi squared contingency table analysis.
chisq <- chisq.test(observed_values)
chisq$observed
round(chisq$expected,2)
