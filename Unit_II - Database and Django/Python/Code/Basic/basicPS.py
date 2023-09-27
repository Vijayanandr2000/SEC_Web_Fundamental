# Problem 1: Hello, World!
print("Problem 1: Hello, World!")
print("Hello, World!\n")

# Problem 2: Simple Calculator
print("Problem 2: Simple Calculator")
num1 = float(input("Enter the first number: "))
num2 = float(input("Enter the second number: "))

sum = num1 + num2
difference = num1 - num2
product = num1 * num2

if num2 != 0:
    division = num1 / num2
else:
    division = "Cannot divide by zero"

print("Sum:", sum)
print("Difference:", difference)
print("Product:", product)
print("Division:", division, "\n")

# Problem 3: Find the Maximum
print("Problem 3: Find the Maximum")
num1 = float(input("Enter the first number: "))
num2 = float(input("Enter the second number: "))
num3 = float(input("Enter the third number: "))

maximum = max(num1, num2, num3)
print("Maximum:", maximum, "\n")

# Problem 4: Factorial Calculation
print("Problem 4: Factorial Calculation")
num = int(input("Enter a non-negative integer: "))

factorial = 1

if num < 0:
    print("Factorial is not defined for negative numbers.")
elif num == 0:
    print("Factorial of 0 is 1")
else:
    for i in range(1, num + 1):
        factorial *= i
    print(f"Factorial of {num} is {factorial}", "\n")

# Problem 5: Palindrome Check
print("Problem 5: Palindrome Check")
text = input("Enter a string: ")
text = text.replace(" ", "").lower()

if text == text[::-1]:
    print("It's a palindrome!")
else:
    print("It's not a palindrome.")
