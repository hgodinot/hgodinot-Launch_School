puts "Up to which number should I look for prime numbers?"
number = $stdin.gets.chomp
n = number.to_i
array = (1..n).to_a

  i = 0

while array[i]**2 < n

i = i + 1
array = array.select do |element|
  element % array[i] != 0 || element / array[i] == 1


end
end

 puts array.drop(1)