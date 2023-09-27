
# Open a text editor (e.g., VSCode, Notepad++) to write Python code.
# Start with the traditional "Hello, World!" example:
print("Hello, World!")


# Variables are used to store data.
# Common data types include integers, floats, strings, and booleans.
name = "John"
age = 30
height = 5.11
is_student = True


# Comments are used for code documentation and are not executed.
# Docstrings provide multi-line documentation for functions and classes.
# This is a single-line comment
"""
This is a docstring.
It provides documentation for a function or module.
"""


# Basic Operators
# Python supports arithmetic, comparison, and logical operators.
x = 10
y = 5
sum = x + y
is_equal = x == y
logical_and = (x > 0) and (y < 10)



# Control Flow - Conditional Statements
# Use if, elif, and else to control program flow.
if age < 18:
    print("You are a minor.")
elif age >= 18:
    print("You are an adult.")
else:
    print("Invalid age.")



# Loops
# Use for and while loops for repetitive tasks.

# Using a for loop
for i in range(5):
    print(i)

# Using a while loop
count = 0
while count < 5:
    print(count)
    count += 1



# Functions
# Functions are reusable blocks of code.
# They can take parameters and return values.

def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")
print(message)



# Lists and Data Structures
# Lists are used to store collections of data.
fruits = ["apple", "banana", "cherry"]
numbers = [1, 2, 3, 4, 5]


# Dictionaries
# Dictionaries store data as key-value pairs.
person = {
    "name": "John",
    "age": 30,
    "city": "New York"
}



# Libraries and Modules
# Python has a vast standard library and external modules for various tasks.

# Importing the math module
import math

# Using a function from the math module
sqrt_value = math.sqrt(25)

# Conclusion
# Python is a versatile and beginner-friendly language.
# Keep practicing and exploring more advanced topics as you progress.

# Remember that programming is a hands-on skill, so practice writing code and solving problems to reinforce your learning. Good luck with your Python journey!
