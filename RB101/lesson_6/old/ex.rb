def digit_list(number)
  result = []
  i = 0
  
  loop do
    break if number / (10 ** i) == 0
    i += 1
  end
  
  loop do
    a = number.divmod(10 ** (i - 1))
    result << a[0]
    number = a[1]
    break if number == 0
    i -= 1
  end

p result
end

puts digit_list(12345)
puts digit_list(7) 