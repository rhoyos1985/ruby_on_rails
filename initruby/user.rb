# Module 
module Destructable 
    def destroy(anyobject)
        puts "I will destroy any object"
    end    
end

# Example of a user class

class User # Always should start with capitalize User
    
    include Destructable
    attr_accessor :name, :email # getters and setters of a class

    def initialize(name,email) # Method what initialize the class
      @name = name
      @email = email
    end

    def run # Ruby's Method, need initialize del class Ex: user = User.new("richard","ric@example.com") user.run
        puts "Hey, i'm Running"        
    end

    def self.identify_yourself  # to run this class method you don't need an instance of user you can directly call the
        puts "Hey I am a class method"
    end

end

class Buyer < User #Inheritance User
    def run
        puts "I'm not running class User"        
    end
end

class Seller < User
    
end

class Admin < User
    
end

user = User.new("Richard", "richard@example.com")
user.run
puts user.name
puts user.email
user.destroy("myname")


buyer1 = Buyer.new("Alfredo1", "alfredo1@example.com")
buyer1.run
seller = Seller.new("Alfredo2", "alfredo2@example.com")
seller.run
admin = Admin.new("Alfredo3", "alfredo3@example.com")
admin.run

puts Buyer.ancestors

User.identify_yourself