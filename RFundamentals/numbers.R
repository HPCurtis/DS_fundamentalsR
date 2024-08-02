# Specify integer and numric type
a <- 10L
b <- 10.5

print(typeof(a))
# Convert to numeric.
c <- as.numeric(a)
print(typeof(c))

print(typeof(b))
# Convert to integer.
d <- as.integer(b)
print(typeof(d))

# Basic arithmetic
x <- 10
y <- 4

print (x + y)
print (x - y)
print (x / y)
print (x * y)

# Power
print (x ** y)
# Remainder / modulus
print (x %% y)

# Min/Max
print(min(x,y))
print(max(x,y))
e = 1234.56789
# Round functiom
print(round(e,3))
print(round(e,-2))