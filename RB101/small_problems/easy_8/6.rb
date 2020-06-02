def divisible_by_3_and_5(number)
  number % 3 == 0 && number % 5 == 0
end

def divisible_by_3(number)
  number % 3 == 0
end

def divisible_by_5(number)
  number % 5 == 0
end

def fizzbuzz(n1, n2)
  result = []
  (n1..n2).each do |x|
    if divisible_by_3_and_5(x)
      result << "Fizbuzz"
    elsif divisible_by_3(x)
      result << "Fizz"
    elsif divisible_by_5(x)
      result << "Buzz"
    else
      result << x
    end
  end
  puts result.join(', ')
end

fizzbuzz(1, 15)