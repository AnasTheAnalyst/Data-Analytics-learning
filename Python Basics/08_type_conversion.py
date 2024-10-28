from tkinter import Y


x= 10          #integar    
y= 10.5        #float
z= "hello!"    #string

y=x*x

# IMPLICIT TYPE CONVERSION
# x=x+y

print(x, "Type of x is: " , type(x))

#EXPLICIT TYPE CONVERSION
age=input("what is your age?  ")
print(type(age))
age=int(age)
print(type(age))

name=input("what is your name? ")
print(name,type(name))
