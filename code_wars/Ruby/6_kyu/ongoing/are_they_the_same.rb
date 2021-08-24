def comp(array1, array2)
  return true if array1 == array2 && array2 == []
  return false if array1.size != array2.size
  array1.sort.map{|x| x ** 2} == array2.sort
end

p comp( [121, 144, 19, 161, 19, 144, 19, 11] , [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true