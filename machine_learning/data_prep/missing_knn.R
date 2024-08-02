# author: Harrison Curtis
# K nearest neighbour imputer example using R, tidyverse and the impute package.

library(VIM)
library(tidyverse)

# Create the tibble
df <- tibble(
  A = c(1, 2, 3, 4, 5),
  B = c(1, 1, 3, 3, 4),
  C = c(1, 2, 9, NA, 20)
)

# Perform KNN imputation
df_imputed <- kNN(df, k = 1)

# kNN return columsn with the imputed true or false so must only return data of interest.
df_imputed <- df_imputed %>% select(colnames(df))

print(df_imputed)