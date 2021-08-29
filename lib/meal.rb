#Structure the relationship with waiter and customer by setting up our Meal class
# Tell the meal class to know all the details of each meal instance 
# including total cost and tip(defaults to 0)
# also who the customer and waiter were for each meal 
# This gives both the customer and waiter instances the ability to get all the information about the meal that they 
# need without having to store it themselves
class Meal
 attr_accessor :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip=0)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end

  def self.all
    @@all
  end
end