def each_with_index(arr)
  (0..arr.size-1).each { |i| yield(arr[i], i) }
  arr
end

# Or one-liner:

def each_with_index(arr)
  (0..arr.size-1).each.with_object(arr) { |i, arr| yield(arr[i], i) }
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
