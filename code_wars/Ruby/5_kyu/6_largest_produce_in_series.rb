def greatest_product(n)
  result = 0
  n = n.chars.map(&:to_i)
  
  0.upto(n.size - 5) do |idx|
    result = n.slice(idx, 5).reduce(:*) if n.slice(idx, 5).reduce(:*) > result 
  end
  
  result
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0