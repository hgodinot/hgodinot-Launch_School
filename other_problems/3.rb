#Select the element out of the array if its index is a fibonacci number.

def is_fibonacci?(num)
  return false if num < 1
  a = b = 1
 until b >= num do 
   b, a = a+b, b
 end
 return true if b == num
 false
end

p is_fibonacci?(0)
p is_fibonacci?(1)
p is_fibonacci?(2)
p is_fibonacci?(20)
p is_fibonacci?(21)

def fib_index_select(arr)
  arr.select.with_index {|x, idx| is_fibonacci?(idx)}
end

p fib_index_select([1, 2, 3, 4, 5, 6]) 
p fib_index_select(('a'..'z').to_a) 
