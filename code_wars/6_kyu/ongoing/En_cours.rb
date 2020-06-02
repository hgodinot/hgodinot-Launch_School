# https://www.codewars.com/kata/5276c18121e20900c0000235/train/ruby
# Faut optimiser, un edge case foire

def find_missing_number(numbers)
  return numbers.max + 1 if numbers.sort == (1..numbers.max).to_a
  ( (1..numbers.max).to_a - numbers)[0]
end

p find_missing_number([2, 3, 4]) == 1
p find_missing_number([1, 3, 4]) == 2
p find_missing_number([1, 2, 4]) == 3
p find_missing_number([1, 2, 3]) == 4