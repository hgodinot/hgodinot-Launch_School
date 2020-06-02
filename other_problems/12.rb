# Write a method that finds all substrings in a string, no 1 letter words.

def substrings(str)
  result = []
  return str if str.length <= 2
  0.upto(str.length - 2) do |idx|
    2.upto(str.length) do |l|
      result << str[idx, l] if (l + idx) <= str.length
    end
  end
  result
end

p substrings("band") == ['ba', 'ban', 'band', 'an', 'and', 'nd']
p substrings("world") == ['wo', 'wor', 'worl', 'world', 'or', 'orl', 'orld', 'rl', 'rld', 'ld']
p substrings("ppop") == ['pp', 'ppo', 'ppop', 'po', 'pop', 'op']

# Write a method that will return all palindromes within a string.

def palindromes(string)
  substrings(string).select {|word| word == word.reverse}
end
p palindromes('ppop') == ['pp', 'pop']

# Write a method that finds the longest substring that is a palindrome within a string.

def longest_palindrome(string)
  palindromes(string).max_by {|x| x.length}
end

p longest_palindrome("ppop") == 'pop'
