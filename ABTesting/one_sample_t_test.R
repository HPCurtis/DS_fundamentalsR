# author: Harrison Curtis
# One Sample T Test
# Date: 2024-07-18
# Description: This script performs a one sample t-test and prints the hypothesis testing results based on the p-value.

# Set seed for reproducibilty.
set.seed(42)

# Simulate single group sample
n <- 5000
population <- int(rnorm(n = n, mean = 500, sd = 100))

# Take random sample of the population with replace equals false so that no repeated values values. 
random_sample <- sample(population, 250, replace = FALSE)

# Plot the data in the form a histogram with denisty curve.
d <- density(random_sample)
h <- hist(random_sample)

# Overlay R base plot using par function.
plot(h)
par(new=TRUE)
plot(d)

population_mean = mean(population)
sample_mean = mean(random_sample)

print(c(population_mean, sample_mean))

null_hypothesis <- "The mean of the sample is equal to the mean of the population"
alternate_hypothesis <- "The mean of the sample is not equal to the mean of the population"
acceptance_criteria <- 0.05

res <- t.test(random_sample, mu = 0, alternative = "two.sided")

p_value <- res$p.value

# Create atuomaticing priniting of result of one-sample t-test.
if (p_value <= acceptance_criteria) {
  cat(
    sprintf(
      "As our p_value probability %f is lower than our acceptance value of %f we reject the null hypothesis and conclude that %s.\n", 
      p_value, 
      acceptance_criteria, 
      alternate_hypothesis
    )
  )
} else {
  cat(
    sprintf(
      "As our p_value probability %f is higher than our acceptance value of %f we retain the null hypothesis and conclude that %s.\n", 
      p_value, 
      acceptance_criteria, 
      null_hypothesis
    )
  )
}
