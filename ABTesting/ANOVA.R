library(easystats)
library(tidyverse)

# Set seed for reproducibility
set.seed(1)

# Number of observations per group
n <- 100

# Means of each group
mean_group1 <- 5
mean_group2 <- 10
mean_group3 <- 15

# Standard deviation (assuming equal variance)
sd <- 3

# Simulate data for each group
group1 <- rnorm(n, mean = mean_group1, sd = sd)
group2 <- rnorm(n, mean = mean_group2, sd = sd)
group3 <- rnorm(n, mean = mean_group3, sd = sd)

# Combine the data into a data frame
df <- data.frame(
  value = c(group1, group2, group3),
  group = factor(rep(c("Group 1", "Group 2", "Group 3"), each = n))
)

# Standard One-ANOVA analysis using base R 
res <- aov(value ~ group, data = df)
res %>%
  report()

# Get the means of each group form the model
estimate_means(res)
# Contrast the grtoup means from model using bonferroni correction.
estimate_contrasts(res, p_adjust = "bonferroni")
                      
