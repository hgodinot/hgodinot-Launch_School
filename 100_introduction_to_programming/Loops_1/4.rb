loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Wrong answer. Please answer "yes" if you want to stop.'
end