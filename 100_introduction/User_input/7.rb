USERNAME = "Barrack"
PASSWORD = "Obama"


loop do
  puts "Please enter your username"
  user = gets.chomp.to_s
  puts "Please enter your password"
  pass = gets.chomp.to_s
  break if ((user == USERNAME) && (pass == PASSWORD))
  puts "Authorization failed!"
end 

puts "Welcome!"

=begin 
#version that checks at each step if USERNAME and PASSWORD are good


USERNAME = "Barrack"
PASSWORD = "Obama"


loop do
  puts "Please enter your username"
  user = gets.chomp.to_s
  break if user == USERNAME
  puts "Authorization failed!"
end 

loop do  
  puts "Please enter your password"
  pass = gets.chomp.to_s
  break if pass == PASSWORD
  puts "Authorization failed!"
end 

puts "Welcome!"
=end 