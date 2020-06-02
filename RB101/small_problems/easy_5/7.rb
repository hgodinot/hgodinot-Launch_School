def word_sizes(string)
  count = Hash.new(0)
  string.gsub(/[^a-z ]+/i, "").split.each do |word|
    count[word.length] += 1
  end
  count
end
