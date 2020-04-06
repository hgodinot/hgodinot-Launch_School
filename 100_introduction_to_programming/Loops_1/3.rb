iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

=begin 
other simpler way, even though the number is not modified then :

5.times do
puts "Number if iterations = 1"
end 

=end 