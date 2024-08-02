# Author Harrison Curtis
# Missing values using the tidyverse

# Laod required packages
library(tidyverse)

df <- tibble(
  A = c(1, 2, 4, NA, 5, NA, 7),
  B = c(4, NA, 7, NA, 1, NA, 2)
)

# Output what values are missing
print(is.na(df))

# Calcaute the number of misisng values per column.
print(colSums((is.na(df))))

# Using tidyr dropna function.
print(df) %>% drop_na()


# Filling Msiing values
df <- tibble(
  A = c(1, 2, 4, NA, 5, NA, 7),
  B = c(4, NA, 7, NA, 1, NA, 2)
)

# Fill NA values.
df_filled <- df %>% replace_na(list(A = 100, B = 100))

# Calculate the mean of column A, ignoring NA values.
mean_value_A <- mean(df$A, na.rm = TRUE)
mean_value_B <- mean(df$B, na.rm = TRUE)

# Fill NA values in columns with the mean value.
df <- df %>%
  mutate(A = replace_na(A, mean_value_A)) %>%
  mutate(B = replace_na(B, mean_value_B))

# Output result.
print(df)