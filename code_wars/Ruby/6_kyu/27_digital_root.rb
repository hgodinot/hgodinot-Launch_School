#Sum of Digits / Digital Root

def digital_root(n)
  n = n.digits
  loop do
    break if n.length == 1
    n = n.sum.digits
  end
  n[0]
end

p digital_root(16) == 7 
p digital_root(456) == 6 

=begin

Input: A positive integer

Output: Positive integer

Rules: Calculate sum of digits until only one digits

Data: Array to add digits

Algorythm:

  Convert number to array
  Start loop
    break loop if array.length == 1
    Sum all number of the array and then put them back in the array, one element per digit (456 => 15 => [1, 5])
  end loop
  array[0]

=end