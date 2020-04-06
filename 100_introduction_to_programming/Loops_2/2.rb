
loop do
  number = rand(100)
  puts number
  break if ((number >= 0) && (number <= 10))
end


# LS Solution 

puts " "

loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end 
