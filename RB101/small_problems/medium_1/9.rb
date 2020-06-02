def fibonacci(n)
  num1 = 1
  num2 = 1
  (n-2).times do
    num2, num1 = num2 + num1, num2
  end
  num2
end

def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end
