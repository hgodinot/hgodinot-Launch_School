# Reverse an array without using the built-in reverse method.

def reverse_array(arr)
  new_arr = []
  1.upto(arr.length) do |idx|
    new_arr << arr[-idx]
  end
  new_arr
end

def reverse_array!(arr)
  arr << reverse_array(arr)
  (arr.flatten!.length / 2).times {arr.shift}
  arr
end

p reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p reverse_array!([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array!([1, 2, 3, 4]) == [4, 3, 2, 1] # mutating - just for fun

