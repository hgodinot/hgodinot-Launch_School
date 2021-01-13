def double_consonants(string)
  string.gsub(/([b-df-hj-np-tv-z])/i, '\1\1')
end

#

def double_consonants(str)
  str.chars.map { |chr| chr.match(/[b-df-hj-np-tv-z]/i) ? chr * 2 : chr }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
