class Customer

  def initialize(id, name, addr)
    # @ sign defines instance variables
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end

  def displayresults()
    puts "customer id #@cust_id"
    puts "customer name #@cust_name"
    puts "customer addr #@cust_addr"
  end

end

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
