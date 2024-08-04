library(readxl)
library(duckdb)

# Path to your Excel file
excel_file_path <- "/home/harrison/Desktop/gitHubRepos/duckdb_learning/grocery_database.xlsx"

# Read the Excel file into a list of data frames
dfs <- lapply(excel_sheets(excel_file_path), function(sheet) {
  read_excel(excel_file_path, sheet = sheet)
})
names(dfs) <- excel_sheets(excel_file_path)

# Connect to DuckDB
con <- dbConnect(duckdb::duckdb(), dbdir = 'groceries.duckdb')

# Iterate over the list and create a table for each data frame
for (sheet_name in names(dfs)) {
  df <- dfs[[sheet_name]]
  
  # Create a table in DuckDB with the same name as the sheet
  dbWriteTable(con, name = sheet_name, value = df, overwrite = TRUE)
  cat(sprintf("Table '%s' created successfully.\n", sheet_name))
}

# Commit and close the connection
dbDisconnect(con)