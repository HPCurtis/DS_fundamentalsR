library(stringr)

string1 <- "data"
string2 <- "Science"

# Print character suing cat function but with newline.
cat(c(string1,"\n"))

# Get the number of characters in character string.
print(nchar(string1))
print(str_length(string1))

# find index of char in character in R.
print(unlist(gregexpr('d', string1)))
print(string1)

# index string
print(substr(string1,3,3))

# COnvert to uppercase and lower case.
print(str_to_upper(string1))
print(str_to_lower(string2))

# Replace character string value. 
string1a <- str_replace(string1, "d","a")
print(paste(string1, "" , string1a))

# Convert to title format.
print(str_to_title(string1))

# Split string.
print(str_split(string1, "a"))

# Count number of characters.
print(str_count(string1, "a"))