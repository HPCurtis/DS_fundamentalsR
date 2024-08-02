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
loyalty_scores <- read_excel(tf, sheet = sheets[5])

customer_details <- read_excel(tf, sheet = sheets[1])

transactions <- read_excel(tf, sheet = sheets[2])

data_for_regression <- left_join(customer_details, loyalty_scores, by = "customer_id")

# Perform group by and aggregation
sales_summary <- transactions %>%
  group_by(customer_id) %>%
  summarize(
    total_sales_cost = sum(sales_cost, na.rm = TRUE),
    total_num_items = sum(num_items, na.rm = TRUE),
    transaction_count = n(),
    unique_product_areas = n_distinct(product_area_id)
  ) %>% rename(
    total_sales_cost = total_sales_cost,
    total_num_items = total_num_items,
    transaction_id_count = transaction_count,
    unique_product_ids = unique_product_areas
  )  %>% 
  mutate(average_basket_value = total_sales_cost / transaction_id_count) %>%
  ungroup()


data_for_regression <- data_for_regression %>%
  inner_join(sales_summary, by = "customer_id")
write_csv(data_for_regression, file = "grocery_regression.csv")
