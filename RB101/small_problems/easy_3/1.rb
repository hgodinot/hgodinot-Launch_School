ORDER = %w(1st 2nd 3rd 4th 5th).freeze
numbers = []
last = 0

ORDER.each do |num|
  loop do
    puts "==> Enter the #{num} number:"
    temp = gets.chomp
    if temp == temp.to_i.to_s 
      numbers << temp.to_i
      break
    end
    puts "Not an integer. Please type again."
  end
end

loop do
  puts "==> Enter the last number:"
  last = gets.chomp
  break if last == last.to_i.to_s
  puts "Not an integer. Please type again."
end

count = numbers.count(last.to_i)
if count > 1
  puts "The number #{last.to_i} appears #{count} time(s) in #{numbers}."
else
  puts "The number #{last.to_i} does not appears in #{numbers}."
end
