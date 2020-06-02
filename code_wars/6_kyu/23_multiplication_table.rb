def multiplication_table(size)

end

def multiplication_table(n)
  result = []
  1.upto(n) do |i|
    result << (i..(i * n)).step(i).to_a
  end
result
end
   
p multiplication_table(3) == [[1,2,3],[2,4,6],[3,6,9]]

=begin

Input:Positive integers (?) 

Output: an array of arrays, n subarrays of n elements each

Rules: Each subarray is an element of the multiplication table. 
First array is [1, 2, 3... n]
second array is [2, 4, 6... 2n]
...
last array is [n, 2n, 3n... n**2]

Algorythm: 
(1..n).step(1).to_a
(2..2n).step(2).to_a
...
(n, 2n... n**2).step(n).to_a

initialize a result variable = []
Go from 1 to n |i|
  for each i: result << (i..(i * n)).step(i).to_a
return result

Rules: Can size = 0 ? 

=end
  