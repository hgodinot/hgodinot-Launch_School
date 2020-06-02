NUMBERS = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ]

def integer_to_string(number, string = "")
  loop do 
    value, remainder = number.divmod(10)
    string.prepend(NUMBERS[remainder])
    number = value
    break if number == 0
  end

string
end

def signed_integer_to_string(number)
  if number < 0
    integer_to_string(-number).prepend("-")
  else
    integer_to_string(number).prepend("+")
  end
end

p signed_integer_to_string(-234)
p signed_integer_to_string(0)
p signed_integer_to_string(-5000)
p signed_integer_to_string(249)
p signed_integer_to_string(52800)