library(stringr)

my_string <- "a cup of coffee"

for (i in my_string)
{
    print(i)
}

for (i in my_string)
{
    print(str_to_upper(i))
}

my_list = c(1, 2, 3, 4, 5, 6, 7, 8, 9)

for (i in my_list)
{
    i_squared = i ** 2
    cat(i, i_squared)
}