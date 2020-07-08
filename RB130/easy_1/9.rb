def one?(array)
  counter = 0
  array.each do |value|
    counter += 1 if yield(value)
    return false if counter >= 2
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