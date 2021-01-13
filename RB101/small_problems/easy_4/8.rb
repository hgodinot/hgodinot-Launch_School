def string_to_integer(str)
  arr = ("0".."9").to_a
  str.chars.map.with_index{|v, i| arr.index(v) * 10 ** (str.size - i - 1)}.sum
end


def string_to_signed_integer(number)
  case number[0]
  when "+" then string_to_integer(number[1..-1])
  when "-" then -string_to_integer(number[1..-1])
  else string_to_integer(number)
  end
end

p string_to_signed_integer("657")
p string_to_signed_integer("-7")
p string_to_signed_integer("67")