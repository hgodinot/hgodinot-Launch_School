
=begin
Input: Positiventeger

Output: Array with 3 integers

Rules:Permute one digit to get smallest integer possible. If several possibilities
of permutation for same result, get smallest index of permutation.
Return indexes of both permutated digits in the array

Edge cases: one digit integer, and every case with several consecutive zeroes. 
Number starting by 0. Would complicate thing but not in test cases.
Integers like 123456789 where no permutation works


Data: Array to compare numbers

Algotythm
loop starting at idx 0 and ending at idx -2:
if number at idx 1 < idx 0 we put number at idx 0 after it most of the time (but not always), and done
One edge case with that : If idx1 == 0 and has 0 after that. In this case we put idx after the last zero
else we keep comparing until idx n < idx or end of array (and no change). Then we put n at first position of array.
If no change we compare number at index 1 with rest of array, doing the same. Till it changes or we reach last number. 

=end

def smallest(n)
  return "this program only works with 2 or more digits numbers" if n.to_s.size <= 0
  numbers = n.chars
  l = numbers.length - 1
  i = j = nil
  
  0.upto(l - 1) do |idx_first|
    idx_first.upto(l) do |idx_second|
      if numbers[idx_first] < numbers|idx_second|
        if idx_second == 0
          
      
  
    
end

p smallest(1000000) == [1, 0, 6]
p smallest(0001000) == [1, 3, 6]
p smallest(261235) == [126235, 2, 0]
p smallest(209917) == [29917, 0, 1]
p smallest(285365) == [238565, 3, 1]
p smallest(269045) == [26945, 3, 0]
p smallest(296837) == [239687, 4, 1]

 