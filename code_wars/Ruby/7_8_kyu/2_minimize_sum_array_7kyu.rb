def min_sum(arr)
  result = 0
  arr.sort!
  (arr.length / 2).times do
    result += arr.shift * arr.pop
  end
  result
end


p min_sum([5,4,2,3]) == 22
p min_sum([12,6,10,26,3,24]) == 342
p min_sum([9,2,8,7,5,4,0,6]) == 74
p min_sum([1,2]) == 2
p min_sum([]) == 0