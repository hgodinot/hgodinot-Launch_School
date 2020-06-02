
NUMBERS = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 
5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def integer_to_string(number, array = [])
  if number == 0
    "0"
  else
    length = 1
    loop do
      break if number / (10 ** length) == 0
      length += 1
    end
    0.upto(length - 1) do |index|
      digit = number / (10 ** ((length - 1)- index))
      array[index] = NUMBERS[digit]
      number -= digit * (10 ** ((length - 1)- index))
    end
    array.join
  end
end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)


