def only_digits(number)
  loop do
    number += 1
  break if number.to_s.chars.uniq == number.to_s.chars
  end
  
  number
end

p only_digits(1986)
p only_digits(1987)
p only_digits(1994)
