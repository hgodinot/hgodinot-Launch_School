def mysterious_math(string)
  p string.gsub(/[+\-*\/]/, "?")
end

mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'
