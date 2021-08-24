def power(base, exponent)
  return nil if exponent < 0
  return 1 if exponent == 0
  result = 1
  
  exponent.times do
    result = result * base
  end
  
  result
end

=begin
Create a method called "power" that takes two integers and returns the value of 
the first argument raised to the power of the second. Return nil if the second argument is negative.
Note: The ** operator has been disabled.

Input : 2 integers
Output: Integer, first integer raised to power of the second except if second is negative

Edge cases: exponent < 0 (return nil) && exponent == 0 (return 1)

Algorythm:
Multiply n times the number, n being exponent. Through an array, or through n.times

=end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
