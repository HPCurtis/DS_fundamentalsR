# author: Harrison Curtis

library(tidyverse)

# load in dataset to tibble.
df <- read_csv("data/feature_selection_sample_data.csv")

# Calculate the correltyion matrix for pearson and spearamn rank.
corr_mat_pearson <- cor(df, method = "pearson")
corr_mat_spearman <- cor(df, method = "spearman")

# Print reuslts
# Investigate the highly correlated variables in ML this often attemted to be avoided
# as it slows model fitting with more variables and can result in multicolinearity which
# reduces interprebilty for models where this is poosible.

print(corr_mat_pearson)
print(corr_mat_spearman)