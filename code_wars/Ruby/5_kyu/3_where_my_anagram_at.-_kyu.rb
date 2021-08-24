def anagrams(string, array)
  string_order = string.chars.sort.join
  array.select do |word|
    word.chars.sort.join == string_order
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
