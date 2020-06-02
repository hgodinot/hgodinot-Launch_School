puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire ?"
retirement = gets.chomp.to_i

remainder = retirement - age
retreat = Time.now.year + remainder

puts "It's #{Time.now.year}. You will retire in #{retreat}."
puts "You have only #{remainder} years of work to go!"
