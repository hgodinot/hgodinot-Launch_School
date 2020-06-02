NUMBERS = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
"5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }

def string_to_integer(number)
  array = number.chars.map { |value| NUMBERS[value] }
  sum = 0
  array.each do |value|
    sum = sum * 10 + value
  end
  
sum
end


def string_to_signed_integer(number)
  case number[0]
  when "+" then string_to_integer(number[1..-1])
  when "-" then -string_to_integer(number[1..-1])
  else
    string_to_integer(number)
  end
end

p string_to_signed_integer("657")
p string_to_signed_integer("-7")
p string_to_signed_integer("67")