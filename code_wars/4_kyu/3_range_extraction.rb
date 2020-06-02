#range_extraction

def solution(list)
  result = ""
  i = 0
  loop do
    break if list[i] == nil
    if list[i + 1] != nil && list[i + 1] - list[i] == 1
      start = list[i]
      last = list[i + 1]
      loop do
        i += 1
        if list[i + 1] != nil && list[i + 1] - list[i] == 1
          last = list[i + 1]
        else
          i += 1
          break
        end
      end
      if last - start == 1
        result << "#{start},#{last},"
      else
        result << "#{start}-#{last},"
      end
    else
      result << "#{list[i]},"
      i += 1
    end
  end
  result.chop
end

p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6,-3-1,3-5,7-11,14,15,17-20"

=begin

Input: Array, with order elements

Output: String

Rules: Combine elements that are ordered, and finaly convert to string

Data: Use array, and fill in a string as we iterate over the array

Algorithm:
Initialize result = ""
initialize start = nil last = nil
Iterate over array, with index. 
  If element followed by element + 1
    begin = element, end = element +1
    Keep comparing last element to element +2, 3... n, till this element is not equal (i += 1)
    to last + 1. Every time, actualize last.
    Put "start-last" in the loop
    keep iterating from element at index +1 (the one that was not equal to last + 1)
  else
    puts "element,"
    i += 1
  for both, stop when we arrive at end of loop. 
  If last element from string is a ",", delete it with chop
=end
