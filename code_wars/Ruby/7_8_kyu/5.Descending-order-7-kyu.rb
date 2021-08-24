def descending_order(number)
  number.to_s.chars.sort.reverse.join.to_i
end

p descending_order(0) == 0
p descending_order(1) == 1
p descending_order(123456789) == 987654321
