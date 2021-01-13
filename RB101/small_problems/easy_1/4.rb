def count_occurrences(list)
  list.uniq.each { |item| puts "#{item} => #{list.count(item)}" }
end
