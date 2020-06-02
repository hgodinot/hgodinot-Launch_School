def prompt(string)
  puts "=> #{string}"
end

prompt("What is the bill?")
bill = gets.chomp.to_f

prompt("what is the tip percentage?")
percentage = gets.chomp.to_f

tip = ((percentage / 100) * bill).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"
