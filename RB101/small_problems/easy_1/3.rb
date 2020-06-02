def digit_list(number)
  result = []
  
  loop do
  number, remainder = number.divmod(10)
  result.unshift(remainder)
  break if number == 0
  end

result
end

def digit_list2(number)
  number.to_s.chars.map(&:to_i)
end