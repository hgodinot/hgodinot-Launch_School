def zip(array1, array2)
  result = []
  0.upto(array1.size - 1) { |idx| result << [array1[idx], array2[idx]]}
  result
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]