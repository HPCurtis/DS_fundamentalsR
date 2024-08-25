# exa,ple fo condiyonal stamenet within the R language and hw they 
# be nested within t exoress desired logic. 
weather = "sunny"

# Nested conditonal statment 
if (weather=="sunny"){
    print("I will go for a run.")

    weather = "cloudy"
    if (weather=="sunny"){
        print("I will go for a run.")
    } 
    else if (weather=="cloudy") {
       print("I will go to gym.")
    }
    else {
        print("I will stay at home")
    }

    weather = "sunny"
    temp = 20

    if (weather=="sunny" & temp > 15){
        print("I will go for a run.")
    }
    else {
        print("Lets just stay in")
    }
}