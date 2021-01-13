def multisum(n)
  (1..n).select{ |i| i % 3 == 0 || i % 5 == 0 }.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
