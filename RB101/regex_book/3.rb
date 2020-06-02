def mystery_math(string)
  p string.sub(/[+\-*\/]/, '?')
end 

mystery_math('4 + 3 - 5 = 2')

mystery_math('(4 * 3 + 2) / 7 - 1 = 1')