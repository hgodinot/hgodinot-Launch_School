def running_total(arr)
  arr.map.with_index{|_, idx| arr[0..idx].sum}
end

running_total([2, 5, 13])
running_total([14, 11, 7, 15, 20])
running_total([3])
running_total([])
