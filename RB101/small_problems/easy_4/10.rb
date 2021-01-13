def signed_integer_to_string(n)
  return "0" if n == 0
  n < 0 ? "-" + integer_to_string(-n) : "+" + integer_to_string(n)
end

def integer_to_string(n)
  return "0" if n == 0
  result = []
  while n > 0
    n, remainder = n.divmod(10)
    result << remainder
  end
  result.reverse.map{ |v| ("0".."9").to_a[v] }.join
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
