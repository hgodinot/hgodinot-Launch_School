def string_to_integer(str)
  arr = ("0".."9").to_a
  str.chars.map.with_index{|v, i| arr.index(v) * 10 ** (str.size - i - 1)}.sum
end

p string_to_integer('4321')
p string_to_integer('570')
p string_to_integer('7')
p string_to_integer('50')
p string_to_integer('4321467')
p string_to_integer('57048')
