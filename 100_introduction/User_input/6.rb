PASSWORD = "Obama"

loop do
  puts "Please enter your password"
  pass = gets.chomp.to_s
  break if pass == PASSWORD
  puts "Invalid password!"
end 

puts "Welcome!"
  