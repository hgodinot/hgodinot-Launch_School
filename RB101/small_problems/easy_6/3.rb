# Recursive method I first did. Stack overflow with indexes that are 10 or more.  
def fibonacci(number)
  case number
  when 1 then 1
  when 2 then 1
  else
    fibonacci(number - 1) + fibonacci(number-2)
  end
end

def find_fibonacci_index_by_length(number)
  i = 1
  while fibonacci(i) < (10 ** (number-1)) do
    i +=1
  end
end 


p find_fibonacci_index_by_length(2) == 7     # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12     # 1 1 2 3 5 8 13 21 34 55 89 144

#non recursive method

def find_fibonacci_index_by_length_2(number)
  first = 1
  second = 1
  index = 2
  
    while second.to_s.size < number do
      second, first = (first + second), second
      index += 1
    end
    
  index
end

p find_fibonacci_index_by_length_2(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length_2(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length_2(10) == 45
p find_fibonacci_index_by_length_2(100) == 476
p find_fibonacci_index_by_length_2(1000) == 4782
p find_fibonacci_index_by_length_2(10000) == 47847