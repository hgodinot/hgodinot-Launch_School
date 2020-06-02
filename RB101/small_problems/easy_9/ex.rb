def buy_fruit(array)
  array.map {|idx| [idx[0]] * idx[1]}.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]