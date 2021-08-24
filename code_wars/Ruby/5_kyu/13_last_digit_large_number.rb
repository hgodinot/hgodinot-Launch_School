def last_digit(n1, n2)
  return 1 if n2 == 0
  return n1 if n2 == 1
  return 0 if n1.to_s[-1] == "0"
  return 1 if n1.to_s[-1] == "1"
  return 5 if n1.to_s[-1] == "5"
  return 6 if n1.to_s[-1] == "6"
  return (n1 ** n2).to_s[-1].to_i if n2 <= 4
  if ["4", "9"].include?(n1.to_s[-1])
    return (n1 ** 2).to_s[-1].to_i if n2 % 2 == 0
    return n1.to_s[-1].to_i
  else
    return (n1 ** 4).to_s[-1].to_i if n2 % 4 == 0
    return ((n1 ** (n2.divmod(4)[1])).to_s[-1].to_i)
  end
end

p last_digit(4, 1) == 4
p last_digit(4, 2) == 6
p last_digit(9, 7) == 9
p last_digit(10, 10 ** 10) == 0
p last_digit(2 ** 200, 2 ** 300)== 6