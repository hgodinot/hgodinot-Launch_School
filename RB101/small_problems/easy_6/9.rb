def include?(array, value)
  array.each { |x| return true if x == value }
end
=begin
def include?(array, n)
  return true if array == [nil] && n == nil
  !!array.find {|x| x == n}    
end
=end
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false 