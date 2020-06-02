def solution(arr1, arr2)
  return "Both arrays don't have the same length, program can't run" if arr1.size != arr2.size
  sum = 0
  
  0.upto(arr1.length - 1) do |idx|
    sum += ((arr1[idx] - arr2[idx]) ** 2)
  end
  
  (sum/arr1.length.to_f)
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1