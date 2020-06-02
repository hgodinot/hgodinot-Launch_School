# Write a method that will return a substring based on specified indices.

def substring(str, n1, n2 = -1)
  result = ""
  return str[n1] if n2 <= n1 
  n1.upto(n2) do |x|
    result << str[x] if str[x] != nil
  end
  result
end

p substring("honey", 0, 2) == "hon"
p substring("honey", 1, 2) == "on"
p substring("honey", 3, 9) == "ey"
p substring("honey", 2)    == "n"
