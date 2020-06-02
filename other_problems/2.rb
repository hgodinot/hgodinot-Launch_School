#Write a method to determine if a word is a palindrome, without using the reverse method.

def palindrome?(str)
  (str.length / 2).times do |idx|
    return false if str[idx] != str[-idx - 1]
  end
  true
end

p palindrome?("hello") == false
p palindrome?("Wow") == false
p palindrome?("wow") == true
