puts "Please write word or multiple words:"
words = gets.chomp
result = words.length - words.chars.count(" ")
puts "There are #{result} characters in \'#{words}\'"
