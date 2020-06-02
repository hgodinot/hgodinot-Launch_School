def f(n)
  
  first = 0
  second = 1
  i = 2
  
  while i <= n 
  first, second = second, first + second
  puts second
  i += 1
    
  end
end


puts f(32)
