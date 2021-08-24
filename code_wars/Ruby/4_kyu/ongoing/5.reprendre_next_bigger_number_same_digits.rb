
require "pry"

def array_rearrange(array)
  -2.downto(-(array.length)) do |higher_digit|
    (higher_digit + 1).upto(-1) do |lower_digit|
      if array[higher_digit] < array[lower_digit]
        array[higher_digit], array[lower_digit] = array[lower_digit], array[higher_digit]
        return array.join.to_i
      end
    end
  end
end
  

def next_bigger(n)
  return -1 if n < 10
  numbers = n.digits.reverse
  array_rearrange(numbers)
  numbers.join.to_i
end
  

p next_bigger(890)

p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(414) == 441
p next_bigger(144) == 414

=begin
1234567890
 Expected: 1234567908, instead got: 1234567980
 Expected: 59884848483559, instead got: 59884848495853
=end

=begin

def next_bigger(n)
  return -1 if n.digits.reverse == n.digits.sort.reverse
  permutations = n.digits.permutation.to_a.map {|perm| perm.join.to_i}
  permutations.select! {|x| x > n }
  return -1 if permutations.size == 0
  permutations.min
end


=end
