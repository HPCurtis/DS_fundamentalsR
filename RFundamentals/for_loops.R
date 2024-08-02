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