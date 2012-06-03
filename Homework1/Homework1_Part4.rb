#a
#Create a class Dessert with getters and setters for name and calories. Define instance 
#methods healthy?, which returns true if a dessert has less than 200 calories, and delicious?
#, which returns true for all desserts.

class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    calories < 200
  end
  def delicious?
    true
  end  
end

#b
#Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. 
#Modify delicious? to return false if the flavor is black licorice (but delicious? should still return 
#true for all other flavors and for all non-JellyBean desserts).
class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  def delicious?
    if flavor == "black licorice"
      false
    else
      true
    end
  end 
end