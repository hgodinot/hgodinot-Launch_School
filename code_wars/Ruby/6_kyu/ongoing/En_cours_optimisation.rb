# What will be the odd one out?

=begin

Input: String

Output: Array of one character strings

Rules: return a list of all the unpaired characters in order of appearance.
In case of multiple appearances to choose from, take the last occurence of the unpaired character (tricky)

Data: Array

Algorithm:
  Initialize result array
  Convert string into array
  Select only the character whose count is odd and store them in an array
  Iterate over this array and for each character, if the count of this character from this index till 
  the end of array is 1, put it in result array
  return result array


=end

def odd_one_out(s)
  arr = s.chars.select {|char| s.chars.count(char).odd? }
  arr = arr.select.with_index {|char, idx| arr[idx..-1].count(char) == 1}
  arr
end

p odd_one_out('Hello World') == ["H", "e", " ", "W", "r", "l", "d"]
p odd_one_out('Codewars') == ["C", "o", "d", "e", "w", "a", "r", "s"]
p odd_one_out('woowee') == []
p odd_one_out('wwoooowweeee') == []
p odd_one_out('racecar') == ["e"]
p odd_one_out('Mamma') == ["M"]
p odd_one_out('Mama') == ["M", "m"]