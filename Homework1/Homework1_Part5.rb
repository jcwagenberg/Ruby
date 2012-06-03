class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string 
    attr_reader attr_name # create the attribute's getter 
    attr_reader attr_name+"_history" # create bar_history getter 
    class_eval %Q(
    def #{attr_name}=(attr_name)  
      @#{attr_name} = attr_name  
      unless @#{attr_name + "_history"}  
          @#{attr_name + "_history"} = []  
          @#{attr_name + "_history"} << nil  
      end  
    
      @#{attr_name + "_history"} << attr_name  
    end  
    )  
  end 
end

#Extend the currency-conversion example from lecture so that you can write
#5.dollars.in(:euros) 10.euros.in(:rupees)
class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    self / @@currencies[singular_currency]
  end
end

#b
#Adapt your solution from the "palindromes" question so that instead of writing palindrome? 
#("foo") you can write "foo".palindrome?
String.class_eval do
  def palindrome?
    self.downcase.scan(/\w/).join == self.downcase.scan(/\w/).join.reverse
  end
end

#c
#Adapt your palindrome solution so that it works on Enumerables.
Enumerable.class_eval do
  def palindrome?
    self.join.downcase.scan(/\w/).join == self.join.downcase.scan(/\w/).join.reverse
  end
end

