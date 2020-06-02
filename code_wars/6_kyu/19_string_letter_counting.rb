def delete_nth(order, max)
  result = []
  order.each_with_index do |val, idx|
    result << val if order[0..idx].count(val) <= max
  end
  result
end

p delete_nth([20,37,20,21], 1) == [20,37,21]
p delete_nth([1,1,3,3,7,2,2,2,2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]