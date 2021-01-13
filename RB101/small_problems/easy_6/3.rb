def find_fibonacci_index_by_length_2(number)
  index = 2
  first, second = [1, 1]
  
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