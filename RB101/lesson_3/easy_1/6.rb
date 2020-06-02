famous_words = "seven years ago..."
add_on = "Four score and "
add_on << famous_words
famous_words = add_on
p famous_words

famous_words_2 = "seven years ago..."
famous_words_2.sub!(/\A/, "Four score and ")
p famous_words_2