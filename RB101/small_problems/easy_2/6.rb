i = 1

50.times do
  puts i
  i += 2
end 

#another way
arr = (1..99)
arr.each do |number| 
  if number.odd?
    puts number 
  end 
end 

#another one
1.upto(99) { |x| puts x if x.odd? }
