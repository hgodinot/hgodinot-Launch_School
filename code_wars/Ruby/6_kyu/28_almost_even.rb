#almost even

def splitInteger(num,parts)
  result = []
  if num / parts == num/parts.to_f
    result = ( [num / parts] * parts)
  else
    result = [num.divmod(parts)[0]] * parts
    rest = [1] * num.divmod(parts)[1]
    rest.each_with_index {|val, idx| result[-idx - 1] += val }
  end
  result
end 


p splitInteger(10, 1) == [10]
p splitInteger(2, 2) == [1,1]
p splitInteger(20, 5) == [4,4,4,4,4]
p splitInteger(20, 6) == [3, 3, 3, 3, 4, 4]

=begin

Input: Two positive integers, greater than 0

Output: Array of integer, whose size is the second integer

Rules: Divide the first integer as evenly as possible. If not perfectly evenly, greater numbers at the end. 

Data: Array

Algorithm: 
  result = []
  Two cases. If number divide perfectly, easy. 
  To check it's the case, num/parts == num/parts.to_f
    In this case, result = ( [num/parts] * parts)
  Else
    result = [num.modulo(parts)[0]] * parts 
    rest = num.modulo(parts)[1] * [1]
    add 1 at the element at index - 1, then -2... untill rest is empty
  end
  result
end 

=end

