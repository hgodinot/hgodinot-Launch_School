def array_diff(array1, array2)
  array2.each { |val| array1.delete(val) }
  array1
end

p array_diff([1,2],[1]) == [2]