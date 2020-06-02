def diamond(n)
  array = (1..n).step(2).to_a + (1..n).step(2).to_a.reverse
  array.delete_at(n/2)
  
  array.each do |x|
    print (" " * ((array.max - x) / 2))
    print ("*" * x)
    puts (" " * ((array.max - x) / 2))
  end
end

diamond(1)
diamond(3)
diamond(9)