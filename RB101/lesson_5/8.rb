hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each do |key, value|
  value.each do |element|
    element.chars.each do |char|
      puts char if char.match?(/[aeiou]/i)
    end
  end
end