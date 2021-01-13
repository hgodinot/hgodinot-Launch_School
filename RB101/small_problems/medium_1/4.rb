def light_on?(n)
  result = [false] * n
  1.upto(n) do |i|
    ((0..n).step(i).to_a - [0]).each {|idx| result[idx - 1] = !result[idx - 1]}
  end
  result.map.with_index {|val, idx| idx + 1 if val}.reject {|val| val == nil}
end

p light_on?(5) #== [1, 4]
p light_on?(10) #== [1, 4, 9]