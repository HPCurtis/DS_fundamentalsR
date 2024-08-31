# Load requisite packages.
library(easystats)
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Number of observations per group
n <- 1000

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

# Visualise the data.
ggplot(data = df, aes(x = group, y = value, fill = group)) +
  geom_boxplot()

# Standard One-ANOVA analysis using base R 
res <- aov(value ~ group, data = df)
res %>%
  report()

# Get the means of each group form the model
means <- estimate_means(res)
# Contrast the group means from model using bonferroni correction method.
constrasts <- estimate_contrasts(res, by = "group", p_adjust = "bonferroni")
