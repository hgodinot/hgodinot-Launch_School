def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end


first = nil
second = nil

loop do 

  loop do
    puts "Please enter the first number:"
    number = gets.chomp
    first = number.to_i
    break if valid_number?(number)
    puts "Invalid input. Only positive or negative integers are allowed."
  end 
  
   loop do
    puts "Please enter the second number:"
    number = gets.chomp
    second = number.to_i
    break if valid_number?(number)
    puts "Invalid input. Only positive or negative integers are allowed."
   end 
  
  
  break if first * second < 0
  puts "Sorry. One integer must be positive, one must be negative."
  puts "Please start over."
  
end 



sum = first + second
puts "#{first} + #{second} = #{sum}"








=begin 


def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end




loop do
  
  
  loop do
    number_1 = nil
    puts "Please enter a positive or negative integer:"
    number_1 = gets.chomp.to_i
      break if valid_number?(number_1)
      puts "Invalid input. Only non-zero integers are allowed."
  end 

  

  loop do
    number_2 = nil
    puts "Please enter a positive or negative integer:"
    number_2 = gets.chomp.to_i
      break if valid_number?(number_2)
      puts "Invalid input. Only non-zero integers are allowed."
  end 
  
  break if number_1 * number_2 < 0
    puts "Please start over."
end

result = number_1 + number_2
puts " #{number_1} + #{number_2} = #{result} "

=end 