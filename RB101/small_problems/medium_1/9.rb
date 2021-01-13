def fibonacci(n)
  num1 = num2 = 1
  (n-2).times do
    num2, num1 = num2 + num1, num2
  end
  num2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501