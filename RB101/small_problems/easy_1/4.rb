def count_occurrences(array, hash = {})
  array.each do |element|
    unless hash[element] != nil
    hash[element] = array.count(element)
    end
  end

hash.each do |key, value|
  puts "#{key} => #{value}"
end
end
