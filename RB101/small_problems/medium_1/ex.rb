def which_light_on?(n)
  arr = [false] * n
  
  1.upto(n) do |number|
    ((number - 1)..(n - 1)).step(number).to_a.each {|idx| arr[idx] = !arr[idx]}
  end
  
  arr.map!.with_index {|val, idx| idx + 1 if val}.delete(nil)
  arr
end


p which_light_on?(4) == [1, 4]
p which_light_on?(10) == [1, 4, 9]