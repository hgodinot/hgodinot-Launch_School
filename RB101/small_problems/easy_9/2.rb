def twice(number)
  return number * 2 if number.to_s.size.odd?
  m = number.to_s.size/2
  number.to_s[0, m] == number.to_s[m, m*2] ? number : number * 2
end

p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10