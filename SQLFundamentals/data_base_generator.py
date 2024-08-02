# Basic python scipt to generate duckdb base with multiple tables based on excel sheet names

import duckdb
import pandas as pd

# Path to your Excel file
excel_file_path = "/home/harrison/Desktop/gitHubRepos/duckdb_learning/grocery_database.xlsx"

# Read the Excel file into a pandas DataFrame
df = dfs = pd.read_excel(excel_file_path, sheet_name=None)
print(df)
con = duckdb.connect('groceries.duckdb')

# Iterate over the dictionary and create a table for each DataFrame
for sheet_name, df in dfs.items():
    # Create a table in DuckDB with the same name as the sheet
    con.execute(f"CREATE TABLE {sheet_name} AS SELECT * FROM df")
    print(f"Table '{sheet_name}' created successfully.")

# Commit and close the connection
con.commit()
con.close()