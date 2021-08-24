def alphabet_position(text)
  result = []
  conversion = {}
  ("a".."z").to_a.each_with_index do |letter, idx|
    conversion[letter] = (idx + 1).to_s
  end
  text.chars.each do |char|
    result << conversion[char.downcase] if ("a".."z").include?(char.downcase)
  end
  result.join(" ")
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""