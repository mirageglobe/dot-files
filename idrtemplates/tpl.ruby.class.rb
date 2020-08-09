class Customer
  # class Customer < Person           # inheritance

  # initialize is magical constructors / deconstructors
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

# === to use object
# john = Customer.new("1", "John", "Wisdom Apartments, Ludhiya")
# john.displayresults()

# === to use class inheritance
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
