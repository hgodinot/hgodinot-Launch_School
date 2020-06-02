def unique_in_order(iterable)
  result = []
  iterable = iterable.chars if iterable.class == String
  iterable = iterable.to_s.chars.map(&:to_i) if iterable.class == Integer
  
  iterable.each do |char|
    result << char if result.length == 0
    result << char if result.length > 0 && char != result[-1]
  end
  result
end

p unique_in_order('AAAABBBCCDAABBB') == ['A','B','C','D','A','B']