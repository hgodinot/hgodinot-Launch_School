#Without the two previous methods. Works, but not just in the same order as the solution
=begin
def palindromes(string)
  result = []
  (0...string.length).each do |idx|
    (0...idx).each do |counter|
      result << string [counter..idx] if 
      string[counter..idx] == string[counter..idx].reverse && string[counter..idx].size != 1
    end
  end
result
end
=end

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

def palindromes(string)
  substrings(string).select {|sub| sub.size > 1 && sub == sub.reverse}
end
  
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]