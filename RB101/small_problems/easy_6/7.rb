def halvsies(array)
  l = (array.length/2.0).ceil
  arr1 = array.slice(0, l)
  arr2 = array.slice(l, l)
  [arr1, arr2]
end 


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
