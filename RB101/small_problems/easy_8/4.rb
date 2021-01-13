def substrings_at_start(string)
  result = []
  array = string.chars
  
  1.upto(string.length) do |idx|
    result << array.slice(0, idx).reduce(:+)
  end
  
  result
end

def substrings(str)
  (0..str.size - 1).map { |i| leading_substrings(str[i..str.size - 1]) }.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
  

