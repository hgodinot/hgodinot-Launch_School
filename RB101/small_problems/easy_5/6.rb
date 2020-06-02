def word_sizes(string)
  result = {}
  array = string.split(" ")
  array.each do |word|
    if result[word.size] == nil
      result[word.size] = 1
    else
      result[word.size] += 1
    end
  end
  result
end
