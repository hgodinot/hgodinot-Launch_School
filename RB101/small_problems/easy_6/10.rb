def triangle(number)
  puts "\n"
  1.upto(number) do |idx|
    puts (" " * (number - idx ) + "*" * idx)
  end
end

triangle(5)
triangle(9)