def substrings_at_start(string)
  result = []
  1.upto(string.size) { |n| result << string.chars.slice(0, n).join }
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']