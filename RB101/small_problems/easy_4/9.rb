def integer_to_string(n)
  return "0" if n == 0
  result = []
  while n > 0
    n, remainder = n.divmod(10)
    result << remainder
  end
  result.reverse.map{ |v| ("0".."9").to_a[v] }.join
end
