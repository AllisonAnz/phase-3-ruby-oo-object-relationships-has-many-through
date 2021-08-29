class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []
  
  # Each instance of Waiter class has a name & attribute describing their years of experience
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end
  
  # Method is like the one in cutomer.rb. except we use customer as a param and self refers to the instacne of Waiter
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  #reuse the #meals method to get an array of meals (from customer.rb)
  # write a #waiter method 
  def waiters 
    meals.map do |meal|
        meal.waiter 
    end
    
  # Build a method so waiters can find the customer that tips the best 
  # just like in customer, waiter needs a way to get all the meals they have served 
  # Create a #meals method again, with subtle changes 
  def meals 
    Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now 
    end 
  end

  # To find the best tipper, we can write another method #best_tipper 
  # use the array we get from #meals, then return the customer of the meal with the highest tip 
  def best_tipper 
    best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip 
        end
    best_tipped_meal
    end
  end
end