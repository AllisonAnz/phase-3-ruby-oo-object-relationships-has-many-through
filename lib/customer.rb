# Build out the class, make sure there is something to store each instance
# Customer class knows about every customer instance that gets created
class Customer
  attr_accessor :name, :age
  # @@all class variable tracks every instance of customer upon creation
  @@all = []

  # each customer instance has a name & age set upon initialization b/c we created an attr_accessor for both
  # the customer can change their name or age 
  # if we wanted to limit this, we would create an attr_reader instead
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  #Give the ability to create a meal 
  # take in an instance of waiter and supply the total and tip 
  # we don't need to take customer as an argument, b/c we're passing in self to refer to the current instance of customer 
  # this method allows us to create a new meal as a customer 
  # automaticlaly associate each new meal with the customer that created it
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  # The customer is going to look at all of the meals and then select only the ones 
  # that belong to them 
  # This method consults the Meal class from the Customer and Watier classes
  # We iterate through every instance of Meal and return only the ones where the meal's 
  # customer matches the current customer isntance
  def meals 
    Meal.all.select do |meal|
        meal.customer == self 
    end 
  end

  #reuse the #meals method to get an array of meals (from customer.rb)
  # write a #waiter method 
  def waiters 
    meals.map do |meal|
        meal.waiter 
    end
  end

end