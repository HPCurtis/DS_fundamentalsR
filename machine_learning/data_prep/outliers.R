# author: Harrison Curtis
# Boxplot method of outlier removal.
# This script demonstrates the removal of
# outliers using the boxplot method using R.
library(tidyverse)

df <- as_tibble(data.frame(input1 = c(15, 41, 44, 47, 50, 53, 56, 59, 99), 
                input2 = c(29, 41, 44, 47, 50, 53, 56, 59, 66)))


# IQR appraoch -----
# plot the data
boxplot(df)

outlier_columns <- c("input1", "input2")

for (column in outlier_columns){

    lower_quartile <- quantile(df[[column]], .25, na.rm = TRUE)
    upper_quartile <- quantile(df[[column]], .75, na.rm = TRUE)
    interquartilerange <- upper_quartile - lower_quartile
    iqr_extended <- interquartilerange * 1.5
    min_border <- lower_quartile - iqr_extended
    max_border <- upper_quartile + iqr_extended
    cat(sprintf("lower quartile=%d and min border=%d\n", lower_quartile, min_border))
    cat(sprintf("upper quartile=%d and max border=%d\n", upper_quartile, max_border))

    # Find the indices of outliers
    outliers <- which(df[[column]] < min_border | df[[column]] > max_border)
}


# Standard deviation approach -----

df <- as_tibble(data.frame(input1 = c(15, 41, 44, 47, 50, 53, 56, 59, 99), 
                input2 = c(29, 41, 44, 47, 50, 53, 56, 59, 66)))
