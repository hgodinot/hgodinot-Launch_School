def string_to_integer(str)
  arr = ("0".."9").to_a
  str.chars.map{|v| arr.index(v)}.reverse.map.with_index{|v, i| v * (10 ** i)}.reverse.sum
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570