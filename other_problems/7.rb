# Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.

def balancer(str)
  count = 0
  str.chars.each do |x|
    count += 1 if x == "("
    count -= 1 if x == ")"
    return false if count < 0
  end
  count == 0
end

p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("(()) hi") == true
p balancer(")(") == false