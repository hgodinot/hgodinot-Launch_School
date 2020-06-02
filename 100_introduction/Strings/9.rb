words = 'car human elephant airplane'
array = words.split(" ")
array.each do |word|
  word << "s"
end 
puts array 