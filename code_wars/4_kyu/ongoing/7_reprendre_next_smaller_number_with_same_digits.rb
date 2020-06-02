require "pry"

def next_smaller(n)
  return -1 if n.digits.reverse == n.digits.sort
  permutations = n.digits.permutation.to_a.map {|perm| perm.join.to_i}
  #binding.pry
  permutations.select! {|x| x < n }
  return -1 if permutations.size == 0
  permutations.max
end


p next_smaller(907) == 790
p next_smaller(531) == 513
p next_smaller(135) == -1
p next_smaller(2071) == 2017
p next_smaller(414) == 144
p next_smaller(123456798) == 123456789
p next_smaller(123456789) == -1
p next_smaller(1234567908) == 1234567890