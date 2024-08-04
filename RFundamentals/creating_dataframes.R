# Create R dataframe.
df <- data.frame(name = c("Tom", "Dick", "Harry"),
                 ID = c(101, 102, 103))

write.csv(df, "names.csv")
# Read csv files
read.csv("names.csv")
