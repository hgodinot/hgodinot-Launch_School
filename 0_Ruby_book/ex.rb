require 'pry'

total = 0

[1, 2, 3].each do |n|
  binding.pry
  total += n
end

return total