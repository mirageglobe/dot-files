# === python

# === references
# - https://devhints.io/python

# === basic commands

# === === array

# lists tuple and dicts

# mutable list - can change, print mylist[0]
mylist = ['physics', 'chemistry', 1997, 2000]

# immutable list - no change, print mytuple[0]
mytuple = ['physics', 'chemistry', 1997, 2000]

# key-value list, print mydict['Name']
mydict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}

# lists are pure listed arrays
list = []

# add to list
list.append(item)
list.insert(index, item)

# combine two lists
list1 + list2

# remove duplicate elements from a list
set(list)

# get dict keys
dict.keys()

# get dict values
dict.values()

# === === class

# basic class
class ClassName:

    kind = 'generalstat'            # class variable shared by all instances

    def __init__(self, name):
        self.name = name            # instance variable unique to each instance

    def f(self):
        return 'hello world'

fido = ClassName('Fido')
fido.kind
fido.name

# (multiple) inheritance example
class DerivedClassName(BaseClassName1, BaseClassName2):
    kind = 'generalstat'            # class variable shared by all instances

    def __init__(self, name):
        self.name = name            # instance variable unique to each instance

    def f(self):
        return 'hello world'

# === === function

def my_function(param1, param2):
    print("function with : " + param1 + ""  + param2)

my_function("one", "two")

# === === if

if expression1:
    statement()
elif expression2:
    statement()
elif expression3:
    statement()
else:
    statement()

# === === loop

# while
i = 1
while i < 6:
    print(i)
    i += 1
    if i == 3:
        break
else:
    print("i is no longer less than 6")

# for each
fruits = ["apple", "banana", "cherry"]
for x in fruits:
    print(x)

# === === print

print('hello' + 'world')
print('hello {name} world')

# === === regex

import re

txt = "The rain in Spain"
x = re.search("^The.*Spain$", txt)

re.match(r'^[aeiou]', str)
re.sub(r'^[aeiou]', '?', str)

# === === switch

# python does not have switch case; use custom function
def week(i):
    switcher={
        0:'Sunday',
        1:'Monday',
        2:'Tuesday',
        3:'Wednesday',
        4:'Thursday',
        5:'Friday',
        6:'Saturday'
    }
    return switcher.get(i,"Invalid day of week")

week(2)

# === === variable

i = 1

# === helper commands ===

# threads - used to assign multi-threading
#
# ```
# ```

# numeric functions
#
# ```
# ```

# string functions
#
# ```
# str.find(",")                 # finds occurance of value and returns bool
# str.index(",")                # same, but raises IndexError
# str.count(",")                # returns number of chars in string
# str.split(",")                # splits str into an list based on delimiter ","
# ```

# ranges short cut
#
# ```
# ```

# type conversions
#
# ```
# int(str)
# float(str)
# str(int)
#
# 'string'.encode()             # encodes the string to a value
# ```

