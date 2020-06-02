# Write a method that combines two Arrays passed in as arguments and returns a new Array that contains all elements 
# from both Array arguments, with the elements taken in alternation. 
# You may assume that both input Arrays are non-empty and that they have the same number of element.

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave_2(arr1, arr2)
  result = []
  0.upto(arr1.length - 1) do |idx|
    result << arr1[idx]
    result << arr2[idx]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, "a", 2, "b", 3, "c"]
p interleave_2([1, 2, 3], ['a', 'b', 'c']) == [1, "a", 2, "b", 3, "c"]