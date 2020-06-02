answer = ""
number = 0

loop do
puts "=> Please enter an integer greater than 0:"
number = gets.chomp.to_i
break if number > 0
puts "=> Invalid number, please type again"
end

loop do
  puts "=> Enter 's' to compute the sum, 'p' to compute the product."
  answer = gets.chomp.downcase
  break if answer[0].start_with?("s", "p")
  puts "=> I did not get this answer. Please type again."
end

if answer.start_with?("s")
  operation = "sum"
  result = (1..number).reduce(:+)
else
  operation = "product"
  result = (1..number).reduce(:*)
end

puts "The #{operation} of the integers between 1 and #{number} is #{result}."
