def interleave(array1, array2)
  array1.zip(array2).flatten
end

def interleave_bis(arr1, arr2)
  arr1.each_with_object([]).with_index { |(val, arr), idx| arr << val << arr2[idx] }
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
