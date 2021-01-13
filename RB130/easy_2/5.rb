def drop_while(array)
  0.upto(array.size - 1) do |idx|
    if !yield(array[idx])
      return array[idx..-1]
    end
  end
  []
end

# other (better) version

def drop_while(array)
  i = 0
  while i < array.size && yield(array[i])
    i += 1
  end
  array[i..- 1] 
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []