def is_an_ip_number?(word)
  (0..255).include?(word.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  if dot_separated_words.size != 4
    return false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
  end

  true
end

p dot_separated_ip_address?("10.4.5.11")
p dot_separated_ip_address?("10.4.5.256")
p dot_separated_ip_address?("10.4.5.11.6")
p dot_separated_ip_address?("10.4.5")