def divisors(num)
  [*1..Integer.sqrt(num)].each_with_object([]) do |candidate, arr|
   arr << candidate << num/candidate if num % candidate == 0
  end.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]

# Other way to do it, longer, more brute force:

def divisors(num)
  result = [*1..num/2].select { |x| num % x == 0 }
  result == 1 ? result : result << num
end