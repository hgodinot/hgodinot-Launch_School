def count(*arr)
  arr.each_with_object([]) { |x, arr| arr << 1 if yield(x) }.sum
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

# With select:

def count(*arguments)
  arguments.select { |x| yield(x) }.size
end