# Has Many Through Relationships 

# We've seen how objects can relate to one another directly when one object 
# contains a reference to another. This is the 'has many"/belongs to' association and is direct relationship 

# In addition to these one-to-one and one-to-many relationships 
# some also need something to join them together 
# You have a relationship with a flight and the pilot has a relationship with the flight 
# So you have a relationship to the pilot through the flight 
# If you take more than one flight, you'll have these kinds of relationships with more than one pilot 
# all still using your ticket as the middle man 
# The way we refer to this is that eacdh customer has many pilots through tickets 

# Check out some more examples:
# A company that offers a network of doctors to their employees through the company's insurance program
# A user on a popular media sharing site can have many "likes", that occur through the pictures they post
# A Lyft driver that you are connected to through the rides you've taken with them


# The Has Many Through Relationship 
# In real life, a customer, each time you go out to eat, you have a different meal 
# Even if you order the samething in the exact same restaurant 
# it's a different instance of that meal 
# So a customer can have many meals

# It's also safe to assume that you'll have many different waiters as well 
# You only have one waiter per meal 
# You relationship with the waiter is through your meal 
# The same could be sid of the waiter's realtionship with each customer 

# How that works in Code
# The way we're going to structure this relationship is by setting up our Meal class as a 'joining' model 
# between our Waiter and our Customer class 
# b/c we're obeying the single source of truth 
# We're going to tell the Meal class to know all the details of each meal instance

# Complete the Has Many Through Relationship 
# We need to find a way for our customer and waiter instances to get information about each other 
# The only way they can get infromation is through the meals they've created 
# If a waiter wanst to know their regular customers are and what meals those customers usually order 
# Or a customer might want to know the name of the waiter of their last meal to leave a good review 
# To get our waiter and customer this information, consult the Meal class FROM Customer and Waiter classes