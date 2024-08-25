# Generate a vector of n zeros
n = 10
zeros = rep(0, n)

# Update the the first index value
zeros[1] = 50

# Get the index where a vector of values 
# meets an certain value using R's which
# function
print(which(zeros == 50))

# Generate 2x3 matrix in R.
m <- matrix(c(1,5,9,8,5,5), nrow = 2, byrow=TRUE)

# Get the row/column inidcies of the value specified.
print(which(m == 5, arr.ind=TRUE))


# Column-major order (linear indexing):
# Index:  1   3   5
#         2   4   6
# Values: 1   5   9
#         8   5   5
print(which(m == 5))