def reverse_words(str)
  str.split.map { |wrd| wrd.size > 4 ? wrd.chars.reverse.join : wrd  }.join(" ")
end
