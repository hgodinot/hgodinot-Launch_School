choice = nil

loop do 
  puts 'Do you want to print something? (y/n)'
  answer = gets.chomp.downcase
  break if ("y" "n").include?(answer)
  puts 'Invalid input! Please enter y or n'
end 

puts 'something' if choice == 'y'
  




=begin

#Why doesn't it work ?

puts 'Do you want to print something? (y/n)'
answer = gets.chomp.downcase

while answer != ("y"||"n") do
  puts "Invalid input! Please enter y or n"
  puts 'Do you want to print something? (y/n)'
  answer = gets.chomp.downcase
end 
  
puts "something" if answer == "y"

=end