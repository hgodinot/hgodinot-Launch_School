def prompt(message)
  puts "=> Enter a #{message}:"
end

prompt("noun")
noun = gets.chomp

prompt("verb")
verb = gets.chomp

prompt("adjective")
adjective = gets.chomp

prompt("adverb")
adverb = gets.chomp

puts "You #{verb} your nice and #{adjective} but naughty #{noun} #{adverb}."
