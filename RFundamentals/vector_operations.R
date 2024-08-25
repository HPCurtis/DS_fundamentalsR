# Generate a vector of n zeros
n = 10
zeros = rep(0, n)

# Update the the first index value
zeros[1] = 50

# Get the index where a vector of values 
# meets an certain value using R's which
# function
which(zeros == 50)

# Generate 2x3 matrix in R.
m <- matrix(c(1,5,9,8,5,5), nrow = 2, byrow=TRUE)

# Get the row/column inidcies of the value specified.
which(m == 5, arr.ind=TRUE)


# Column-major order (linear indexing):
# Index:  1   3   5
#         2   4   6
# Values: 1   5   9
#         8   5   5
which(m == 5)

# All the abov ematrrices work for other operators

which(m < 5)
which(m > 5)
which(m != 5)

# Flatten amtrrix
as.vector(m)
c(m)

# Stacking vectors.
v1 <- c(1,2,3)
v2 <- v1
# Stack horizontally
cbind(v1,v2)

# stack vertically
rbind(v1,v2)