def rotation(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  result = number.to_s.chars
  result[-n..-1] = rotation(result[-n..-1])
  result.join.to_i
end

def max_rotation(num)
  num.digits.size.downto(2) do |i|
    num = rotate_rightmost_digits(num, i)
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
