#Part 1
#(a)
#Write a method that determines whether a given word or phrase is a palindrome
#, that is, it reads the same backwards as forwards, ignoring case, punctuation, 
#and nonword characters.
def palindrome?(string)
  string.downcase.scan(/\w/).join == string.downcase.scan(/\w/).join.reverse
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")

#(b)
#Given a string of input, return a hash whose keys are words in the string and 
#whose values are the number of times each word appears. Don't use for-loops. 
#(But iterators like each are permitted.) Nonwords should be ignored. Case 
#shouldn't matter. A word is defined as a string of characters between word boundaries. 
#(Hint: the sequence \b in a Ruby regexp means "word boundary".)
def count_words(string)
  counter = Hash.new(0)
  string.downcase.scan(/[\w']+/).each {|word| counter[word] += 1}
  return counter
end

puts count_words("A man, a plan, a canal -- Panama")

#use gsub dont use split for bith 1 a) and 1 b)
#[6/2/12 9:59:59 AM] subin m: gsub(/\W/, " ")
#[6/2/12 10:00:05 AM] subin m: this will help