def merge(arr1, arr2)
  result = []
  idx1 = idx2 = 0
  
  until idx1 >= (arr1.length ) && idx2 >= (arr2.length ) do
    if arr1[idx1] != nil && (arr2[idx2] == nil || arr1[idx1] <= arr2[idx2])
      result << arr1[idx1]
      idx1 += 1
    elsif arr2[idx2] != nil && (arr1[idx1] == nil || arr2[idx2] < arr1[idx1])
      result << arr2[idx2]
      idx2 += 1
    end
  end
  
  result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]