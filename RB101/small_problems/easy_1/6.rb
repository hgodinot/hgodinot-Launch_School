def reverse_words(string, newstring = [])
  string.split.each do |word| 
    word.reverse! if word.length >= 5
    newstring << word
  end 
  
  newstring.join(' ')
end

