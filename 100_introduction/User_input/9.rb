result = nil
number = nil

loop do

  loop do
    puts "How many output lines do you want? Enter a number >= 3 (Q to quit):"
    result = gets.chomp 
    break if result.downcase == "q"
    
    
    number = result.to_i
    break if number >=3
    puts "That's not enough lines."
  end 
  
  break if result.downcase == "q"
  number.times do
    puts "Launch School is the best!"
  end 
    
end









=begin 



result = nil
number = nil

  loop do
    puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
    result = gets.chomp
    number = result.to_i
    break if result.downcase == 'q'
    if number >= 3
      while number > 0
        puts 'Launch School is the best!'
       number -= 1
      end
      break
    end
    puts ">> That's not enough lines."
  end
=end 
