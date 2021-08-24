def is_punctuation?(string)
  [".", ",", ";", "!", "?"].include?(string)
end

def pig_it(string)
  array = string.split
  array.map! do |word|
    if is_punctuation?(word)
      word
    else
      arr_word = word.chars
      arr_word << arr_word[0] << "ay"
      arr_word.shift
      arr_word.join
    end
  end
  array.join(" ")
end

p pig_it('Pig latin is cool') == "igPay atinlay siay oolcay"
p pig_it('Hello world !') == "elloHay orldway !"
