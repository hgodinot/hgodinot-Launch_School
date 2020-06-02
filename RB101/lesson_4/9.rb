def titleize(words)
  words.split.map {|word| word.capitalize}.join(" ")
end

words = "the flintstones rock"
p titleize(words)