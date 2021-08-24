def solve(s)
  hsh = {}
  max = 0
  ("a".."z").each_with_index {|letter, idx| hsh[letter] = idx + 1 }
  s.split(/[aeiou]/i).each do |char|
    temp = 0
    char.length.times do |i| 
      temp += hsh[char[i]] if hsh[char[i]] != nil
    end
    max = temp if temp > max
  end
  max
end


p solve("zodiac") == 26
p solve("chruschtschov") == 80
p solve("khrushchev") == 38
p solve("strength") == 57
p solve("catchphrase") == 73
p solve("twelfthstreet") == 103
p solve("mischtschenkoana") == 80