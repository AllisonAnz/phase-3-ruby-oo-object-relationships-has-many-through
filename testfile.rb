require_relative './lib/customer.rb'
require_relative './lib/meal.rb'
require_relative './lib/waiter.rb'

  sam = Customer.new("Sam", 27)
  p sam.name #=> "Sam"
  pat = Waiter.new("Pat", 2)
  alex = Waiter.new("Alex", 5)

  # A Customer creates a Meal, passing in a Waiter instance
  sam.new_meal(pat, 50, 10) 
  
  # A Customer creates a Meal, passing in a Waiter instance
  sam.new_meal(alex, 20, 3) 
  
  # A Waiter creates a Meal, passing in a Customer instance
  pat.new_meal(sam, 30, 5) 

# Complete the Has Many Through Relationship 
# We need to find a way for our customer and waiter instances to get information about each other 
# The only way they can get infromation is through the meals they've created 
# To get our waiter and customer this information, consult the Meal class FROM Customer and Waiter classes
# The customer is going to look at all of the meals and then select only the ones 
  # that belong to them 
  # def meals 
  #   Meal.all.select do |meal|
  #       meal.customer == self 
  #   end 
  # end
  # This method consults the Meal class from the Customer and Watier classes
  # We iterate through every instance of Meal and return only the ones where the meal's 
  # customer matches the current customer instance

# If Rachel, wants to know about all of her meals, all we need to do is call the #meals 
# method on her Customer instance 
alex = Customer.new("Alex", 30)
rachel = Customer.new("Rachel", 27)
dan = Waiter.new("Dan", 3)

rachel.new_meal(dan, 50, 10)
alex.new_meal(dan, 30, 5)

rachel.meals #=> [#, @customer=#, @total=50, @tip=10>]
rachel.meals.length #=> 1
Meal.all.length #=> 2
# ABove two meals were created, one for reach and one for alex 
# boeth with the same waiter 
# However, running reach.meals only returns the meal rachel is associated with 

# What if we wanted a lsit of all of the waiter that Rachel has interacted with 
# Each meal is associated with a waiter, 
# To get every waiter from every meal Rachel has had 
# We need to take the array of all of Reachel's meals 
# map over it, getting the waiter from each one of those meals
#reuse the #meals method to get an array of meals (from customer.rb)
  # write a #waiter method in waiter.rb
#  def waiters 
#    meals.map do |meal|
#        meal.waiter 
#    end
terrance = Customer.new("Terrance", 27)
jason = Waiter.new("Jason", 4)
andrew = Waiter.new("Andrew", 7)
yomi = Waiter.new("Yomi", 10)

terrance.new_meal(jason, 50, 6)
terrance.new_meal(andrew, 60, 8)
terrance.new_meal(yomi, 30, 4)

terrance.waiters #=> [#, #, #] 
terrance.waiters.length #=> 3

# If terrance wanted to find the name of his last waiter, 
# we can use the #waiter method, then just get the name of the lst waiter in the Array 
terrance.waiters.last.name #=> "Yomi"

# build a method so a waiter can find the customer that tips the best
# just like in the customer, the waiter needs a way to get all the meals they served 
# create a meals method again, with subtle changes in waiter.rb
# def meals
#   Meal.all.select do |meal|
#     meal.waiter == self #checking for waiter now
#   end
# end

# To find the best tipper, we can write another method #best_tipper 
# use the array we get from #meals, then return the customer of the meal with the highest tip 
#  def best_tipper 
#    best_tipped_meal = meals.max do |meal_a, meal_b|
#        meal_a.tip <=> meal_b.tip 
#    end
#    best_tipped_meal
#  end
#end
jason = Waiter.new("Jason", 4)
lisa = Customer.new("Lisa", 24)
tim = Customer.new("Tim", 35)
terrance = Customer.new("Terrance", 27)

terrance.new_meal(jason, 50, 3)
lisa.new_meal(jason, 40, 10)
tim.new_meal(jason, 45, 8)

jason.best_tipper #=> #
jason.best_tipper.name #=> "Lisa"
  



  