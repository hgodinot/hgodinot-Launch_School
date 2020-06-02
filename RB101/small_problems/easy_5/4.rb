def swap(string)
  result = string.split(" ").map do |word| 
    word [0], word[-1] = word[-1], word[0]
    word
  end
  result.join(" ")
end
