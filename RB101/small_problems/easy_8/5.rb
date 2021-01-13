def leading_substrings(str)
  str.chars.map.with_index { |_, idx| str.chars[0..idx].join }
end

def substrings(str)
  (0..str.size - 1).map { |i| leading_substrings(str[i..str.size - 1]) }.flatten
end

def palindromes(str)
  substrings(str).select { |wrd| wrd.size > 1 && wrd == wrd.reverse }
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