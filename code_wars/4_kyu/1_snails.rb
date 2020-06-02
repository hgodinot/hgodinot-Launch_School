def snail(array)
  result = []
  return result if array.flatten.length == 0
  
  loop do
    result << array[0]
    array.delete_at(0)
    break if array.flatten.length == 0
    array.each do |subarray|
      result << subarray[-1]
      subarray.delete_at(-1)
    end
    result << (array[-1].reverse)
    array.delete_at(-1)
    array.reverse.each do |subarray|
      result << subarray[0]
      subarray.delete_at(0)
    end
  end
  
  result.flatten!.delete(nil)
  result
end

p snail( [[1,2,3],[4,5,6],[7,8,9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
a = [1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8], [13, 12, 11, 10, 9]
p snail(a)
