def show_multiplicative_average(array)
  result = array.reduce(:*).to_f / array.length
  puts "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])