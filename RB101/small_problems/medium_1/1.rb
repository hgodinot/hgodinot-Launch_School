def rotate_array(arr)
  arr.slice(1, arr.length - 1) + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

def rotate_string(string)
  array = string.chars
  (array[1..-1] + [array[0]]).join
end

p rotate_string("element") == "lemente