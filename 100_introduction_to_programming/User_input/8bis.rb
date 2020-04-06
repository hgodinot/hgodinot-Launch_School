


=begin 


def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil

loop do
  puts "Please enter the numerator:"
  numerator = gets.chomp
  
  break if valid_number?(numerator)
  puts "Invalid input. Only integers are allowed"
end 

denominator = nil

loop do
  puts "Please enter the denominator:"
  denominator = gets.chomp
  
    if denominator == "0"
      puts "Invalid input. A denominator of 0 is not allowed."
    else 
      break if valid_number?(denominator)
      puts "Invalid input. Only integers are allowed"
    end 
end

result = numerator.to_i/denominator.to_i
puts "#{numerator} / #{denominator} is #{result}"

=end 

=begin
#first try in one loop. Too heavy.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end
n_1 = nil
n_2 = nil

loop do 
  puts "Please enter the numerator"
  n_1 = gets.chomp
  if valid_number?(n_1)
    puts "Please enter the denominator"
    n_2 = gets.chomp
    if valid_number?(n_2) 
      break if n_2 !+ 0
      puts "Invalid input. A denominator of 0 is not allowed."
      end   
    else 
      puts
=end



