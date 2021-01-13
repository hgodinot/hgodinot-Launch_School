def one?(arr)
  counter = 0
  arr.each do |x|
    counter += 1 if yield(x)
    return false if counter > 1
  end
  counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } ==false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false

# Shorter solution, but does not replicate exactly the one method, though 
# it passes the tests. Does not stop iterating after a second element has been found

def one?(array)
  array.select { |x| yield(x) }.size == 1
end