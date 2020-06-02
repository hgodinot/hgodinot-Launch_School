def substrings_at_start(string)
  result = []
  array = string.chars
  
  1.upto(string.length) do |idx|
    result << array.slice(0, idx).reduce(:+)
  end
  
  result
end

def substrings(string)
  result = []
  (0...string.length).each do |idx|
    result << substrings_at_start(string.slice(idx, string.length - idx))
  end
  result.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
  

