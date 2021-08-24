def persistence(number)
  counter = 0
  
  loop do
  break if number < 10
  counter += 1
  number = number.digits.reverse
  number = number.reduce(:*)
  end
  
  counter
end

p persistence(39)
p persistence(999)
p persistence(4)