
# this is a ruby template for quick start.

# good references can be found:
# - https://devhints.io/ruby
# - https://www.tutorialspoint.com/ruby/ruby_blocks.htm

# === basic commands ===

# == print
#
# print "hello \n"
# puts "hello"
# p "hello"         # puts same as p

# == variable contants
#
# VARCONST = "this is a constant"
# puts "value of constant is #{VARCONST}"
#
# $globalvar = "this is a global variable"

# == arrays
#
# cars = Array.new(20)
# puts cars.size
# puts cars.length

# == if conditionals
#
# if ($temperature < "20")
#   puts "have a good day!"
# elsif
#   puts "great"
# else
#   puts "awesome"
# end

# == loops while
#
# $x = 0
#
# while $x <= 5 do
#   puts "#{x}"
#   $x +=1
# end

# == for each item loop
#
# instance_values.each do |field, val|
#   if seems_true? val
#   # handle true
# end

# == function
#
# def method_name (farg, farg2 = 50)
#   puts "#{farg}"
#   rtnval = farg2
#   
#   return $rtnval
# end

# == class
#
# class Customer
#
#   def initialize(id, name, addr)
#     # @ sign defines instance variables
#     @cust_id = id
#     @cust_name = name
#     @cust_addr = addr
#   end
#
#   def displayresults()
#     puts "customer id #@cust_id"
#     puts "customer name #@cust_name"
#     puts "customer addr #@cust_addr"
#   end
#
# end
#
# cust1 = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
# cust1.displayresults()

# == class constructors destructors (ruby uses initialize)
# # ruby magically does it, thus no constructors/destructors
#
# class Customer
#
#   def initialize(id, name, addr)
#     # @ sign defines instance variables
#     @cust_id = id
#
#     etc...
#   end
#
# end

# == class inheritance
#
# class Person
#
#   def breathe
#     puts "inhale and exhale"
#   end
#
# end
#
# class Customer < Person
#
#   def speak
#     puts "hello"
#   end
#
# end
#
# james = Customer.new
# james.breathe
# james.speak

# === helper commands ===

# == regular expressions
#
# text = "A regular expression is a sequence of characters that define a search pattern."
#
# matches = text.match(/character/)
# puts matches
#
# puts text.scan(/\b[aeiou][a-z]*\b/)

# == type conversions
#
# "12".to_i         # ==> 12
# "abc123".to_i     # ==> 0
# 12.to_s           # ==> "12"

# == string functions
#
# String.try_convert("str")   # => 12.40
# String.try_convert(/re/)    # => nil

# == numeric functions
#
# num = 12.40
# puts num.floor      # 12
# puts num + 10       # 22.40
# puts num.integer?   # false as num is a float.

# == ranges short cut
#
# (1..5)            # ==> 1, 2, 3, 4, 5
# (1...5)           # ==> 1, 2, 3, 4
# ('a'..'d')        # ==> 'a', 'b', 'c', 'd'

# == threads - used to assign multi-threading
#
# puts "Started At #{Time.now}"
# t1 = Thread.new{func1()}
# t2 = Thread.new{func2()}

