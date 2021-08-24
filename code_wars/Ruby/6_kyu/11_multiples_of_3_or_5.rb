def solution(number)
  multiples3 = []
  multiples5 = []
  return 0 if number < 4
  return 3 if number < 6
  x = 3
  
  loop do
  multiples3 << x
  x += 3
  break if x >= number
  end
  
  x = 5
  loop do
  multiples5 << x
  x += 5
  break if x >= number
  end
  
  (multiples3 + multiples5).uniq.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
