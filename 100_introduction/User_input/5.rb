number = nil

loop do
  puts "Give a number 3 or more please."
  number = gets.chomp.to_i
  break if number >=3
  puts "Not enough. Give a number 3 or more please."
end 

number.times do
  puts "Launch School is the best!"
end


=begin 
#first solution

puts "Give a number please:"
number = gets.chomp.to_i

  if number < 3 
    loop do
    puts "Give a number that is 3 or more please"
    number = gets.chomp.to_i
    break if number >= 3
    end 
  end 
    
number.times do
  puts "Launch School is the best!"
end
 
=end 
  
