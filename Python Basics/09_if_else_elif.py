import re


hammad_age = 2
required_age=5

if hammad_age==required_age:
    print("hammad can join the school")
elif hammad_age>required_age:
    print("hammad can join higher classes")
elif hammad_age == 2:
    print("take care of hammad")
else:
    print("hammad cannot join the school")

print(hammad_age>3)


# number divisible by 3 or 7

number = 369
if (number < 100 or number >= 300) and(number % 3 ==0 or number % 7== 0):
    if(number % 3==0 or number % 7==0):
        print("divisible by both")
    elif(number % 3==0):
        print("divisible by 3")
    else:
        print("divisible by 7")
else:
        print("not a special number")





