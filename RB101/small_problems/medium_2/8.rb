def featured(num)
  n += 1
  n += 1 until n % 7 == 0 && n.odd?
  
  until num.digits.uniq == num.digits || num > 9876543210
    num += 14
  end
  
  return "No number that fulfills those requirements" if num > 9876543210
  num
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
