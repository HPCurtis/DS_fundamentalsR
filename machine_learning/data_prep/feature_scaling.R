# author: Harrison Curtis
# This script demonstrates the standard feature scaling options for machine learning algortihms using R.

df <- data.frame(
  Height = c(1.98, 1.77, 1.76, 1.80, 1.64),
  Weight = c(99, 81, 70, 86, 82)
)

# Standaridaition
df_scaled <- scale(df)

# Normalisation method

minmax_scaler <- function(x) {
    return((x - min(x)) / (max(x) - min(x)))
}  
