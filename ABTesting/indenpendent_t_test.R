# author: Harrison Curtis
# One Sample T Test
# Date: 2024-07-18
# Description: This script performs a twi sample independent t-test and prints the hypothesis testing results based on the p-value.


# Set seed for reproducibilty.
set.seed(42)

# Simulate single group sample
n <- 5000
population_a <- as.integer(rnorm(n = n, mean = 500, sd = 100))
population_b <- as.integer(rnorm(n = n, mean = 500, sd = 100))

sample_a <- sample(population_a, 250) 
sample_b <- sample(population_b, 250) 

sample_a_mean <- mean(sample_a)
sample_b_mean <- mean(sample_b)

print(c(sample_a_mean, sample_b_mean))

# State hypothesis & set acceptance criteria

null_hypothesis = "The mean of the sample a is equal to the mean of the sample b"
alternate_hypothesis = "The mean of the sample a is not equal to the mean of the sample b"
acceptance_criteria = 0.05

# Conduct classical t-test.
res <- t.test(sample_a, sample_b, alternative = "two.sided", var.equal = TRUE)
p_value <- res$p.value

# Print the results with p-value probability distribution value
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


# Apply Welch's t-test by changing the var.equal parameter.
res <- t.test(sample_a, sample_b, alternative = "two.sided", var.equal = FALSE)
p_value <- res$p.value

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
