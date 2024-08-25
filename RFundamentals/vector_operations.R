# Generate a vector of n zeros
n = 10
zeros = rep(0, n)

# Update the the first index value
zeros[1] = 50

# Get the index where a vector of values 
# meets an certain value using R's which
# function
print(which(zeros == 50))