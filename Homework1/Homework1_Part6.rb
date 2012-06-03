#Create a method that accepts two sequences and returns an iterator that will yield the elements of 
#the Cartesian product, one at a time, as a two-element array.

class CartesianProduct
  include Enumerable
        
  def initialize(array_1,array_2)
    @array_1,  @array_2 = array_1, array_2
  end
  
  def each       
    @array_1.each do |a1|
      @array_2.each do |a2|
        yield [a1,a2]
      end                    
    end                    
  end
end