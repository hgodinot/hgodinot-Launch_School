def next_smaller(n)
  p n
  return -1 if n.digits.reverse == n.digits.sort
  permutations = n.digits.permutation.to_a.select { |perm| perm.first != 0 }
                                          .map {|perm| perm.join.to_i}
  permutations.reject! {|x| x >= n }
  return -1 if permutations.size == 0
  permutations.max
end

#1027
# time out : 1234567908
p next_smaller(1234567908) == 1234567890
p next_smaller(1027) == -1
p next_smaller(907) == 790
p next_smaller(531) == 513
p next_smaller(135) == -1
p next_smaller(2071) == 2017
p next_smaller(414) == 144
p next_smaller(123456798) == 123456789
p next_smaller(123456789) == -1
p next_smaller(1234567908) == 1234567890

# Return -1 (for Haskell: return Nothing, for Rust: return None), 
# when there is no smaller number that contains the same digits. 
# Also return -1 when the next smaller number with the same digits 
# would require the leading digit to be zero.

=begin
def next_smaller(n)
  array = n.digits.reverse
  return -1 if array == array.sort
  first = second = nil
  loop do
    idx = comparison = -1
    loop do
      comparison -= 1
      break if -comparison > array.size
      if array[idx] < array[comparison]
        first, second = idx, comparison
        break
      end
    end
    break if first || comparison + array.size < 0
    idx -= 1
  end
  binding.pry   
end
=end