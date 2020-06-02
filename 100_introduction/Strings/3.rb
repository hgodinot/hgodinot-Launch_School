# my solution

name = 'Roger'
if name.downcase == "RoGeR".downcase
  puts "true"
else 
  puts "false"
end 

name = 'Roger'
if name.downcase == "DAVE".downcase
  puts "true"
else 
  puts "false"
end 

# LS Solution
puts ""

name = 'Roger'
puts name.casecmp("RoGeR") == 0
puts name.casecmp("DAVID") == 0
