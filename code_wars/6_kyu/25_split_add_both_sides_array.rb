
=begin

Split and then add both sides of an array together.

Input: An array of integers, and a positive integers

Output: An array of integers

Rules: Split and add the arrays n times. Stop before n if we have only one number in the array. 
If n = 0, return array passed in as argument. 
If arr has only one number, return it already. 

Data: Stay with arrays

Algorithm: 
Use slice method to divid arrays. Tricky when array.length is an odd number. 
i = 0. If n > i do & if arr.length > 1:
[1, 2, 5, 7, 2, 3, 5, 7, 8] : arr[0, arr.length/2] & arr[arr.length/2, arr.length] (go farther than the end of array but not a problem)
Then add elements from both arrays. If one array is shorter than the other, start at index 1 for this second array. 
i += 1. Keep going untill conditions to stop met (n > i do & if arr.length > 1)

Define method
i = 0
Start loop 
break if n > i do & if arr.length > 1
arr1 = arr[0, arr.length/2]
arr2 = arr[arr.length/2, arr.length]
arr = []
if arr1.length equal to arr2.length are the same, use each with index method for arr1, and for each index add elements 
from arr1 & 2 at these index and put them in arr
if not the same length, add element at index 0 of arr2 (longer array) in arr, and then call each with index method on arr1, and for each index
add element at arr1 and arr i + 1
i += 1
end of loop
Return arr
=end


def split_and_add(arr, n)
  i = 0
  loop do
    break if (i >= n || arr.length == 1)
    arr1 = arr[0, arr.length/2]
    arr2 = arr[arr.length/2, arr.length]
    arr = []
    if arr1.length == arr2.length 
      arr1.each_with_index {|x, idx| arr << ( arr1[idx] + arr2[idx] ) }
    else
      arr << arr2[0]
      arr1.each_with_index {|x, idx| arr << ( arr1[idx] + arr2[idx + 1] ) }
    end
    i += 1
  end
  arr
end


p split_and_add([1, 2, 5, 7, 2, 3, 5, 7, 8], 1) == [2, 4, 7, 12, 15]
p split_and_add([4, 2, 5, 3, 2, 5, 7], 2) == [10, 18]