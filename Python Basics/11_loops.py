# while loops

# from re import X

# x=2
# while (x<=5):
#     print(x)               # #loop means print when x 5 tak pounch jahay
#     x=x+1        #increment is also necessary

# from math import factorial


1 # for loop
# For loop 
# 1  In for loop you know how many times statment is printed
# 2  For loop provides a syntax in which following information
# is provided
# - Boolean condition
# - intial value of counting variable
# - incrementation of counting variable

# fruits = ['mangoes','apples','bananas']

# for fruit in fruits:
#     print("current fruit:",fruit)

# print("good bye")

# for x in range(6,12):
#     print(x)
        
2 # array

days =["mon","tue","wed","thu","fri","sat","sun"]
for di in days:
     if (di=="fri"):break
     print(di)

# 3 array

# days =["mon","tue","wed","thu","fri","sat","sun"]
# for d in days:
#     if (d=="fri"):continue
#     print(d)

# simple situation

# count = 0
# while count<9:
#     print("Number:",count)
#     count =count+1

# print("good bye")

# little guessing game

# import random
# n = 20
# to_be_guessed = int(n * random.random())+1
# guess = 0

# while guess != to_be_guessed:
#     guess = int(input("New number:"))
#     if guess > 0:
#         if guess > to_be_guessed:
#             print("Number is to large")
#         elif guess < to_be_guessed:
#                 print("Number is to small")
#     else:
#         print("you are giving it!")
#         break
# else:
#         print("congratulations you made it!")




# 1.3  let find Factorial 
# - we know the iteration so for is the better options

# num =int(input("Number:"))
# factorial=1

# if num < 0:
#     print("must be positive")
# elif num == 0:
#     print("factorial=1")
# else:
#     for i in range(1,num + 1):
#         factorial=factorial*i
# print(factorial)


        





