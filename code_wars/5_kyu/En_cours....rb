def scramble_words(words)
  return words if words.size < 4
  #your code here
end

=begin

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation
=end

p scramble_words('professionals') == 'paefilnoorsss' #'The first and last letters of a word should reamin in place with the inner letters sorted'
p scramble_words('i')  ==  'i'# 'Must handle single charater words')
p scramble_words('')  == ''# 'Must handle empty strings')
p scramble_words('me')  == 'me'#'Must handle 2 charater words')
p scramble_words('you') == 'you'# 'Must handle 3 charater words')
p scramble_words('card-carrying') == 'caac-dinrrryg'# 'Only spaces separate words and punctuation should remain at the same place as it started')
p scramble_words("shan't") == "sahn't"# 'Punctuation should remain at the same place as it started')
p scramble_words('-dcba') == '-dbca'# 'Must handle special character at the start')
p scramble_words('dcba.') == 'dbca.'# 'Must handle special character at the end')
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."# 'Must handle a full sentence')
