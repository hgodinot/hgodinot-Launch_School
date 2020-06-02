statement = "The Flintstones Rock"
result = {}
letters = ("A".."Z").to_a + ("a".."z").to_a
letters.each do |letter|
  frequencie = statement.count(letter)
  result[letter] = frequencie if frequencie > 0
end
p result

#First solution. Would have to be modified to account for other spaces.
=begin
statement = "The Flintstones Rock"
hash = {}
0.upto(statement.length - 1) do |idx|
  if hash.has_key?(statement[idx])
    hash[statement[idx]] += 1
  else
    hash[statement[idx]] = 1
  end
end
p hash
=end
