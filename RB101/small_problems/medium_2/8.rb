def featured(n)
  n += 1
  n += 1until n % 7 == 0 && n.odd?
  
  loop do
    return n if n.to_s.chars == n.to_s.chars.uniq
    n += 14
    break if n > 9876543210
  end
  
  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
