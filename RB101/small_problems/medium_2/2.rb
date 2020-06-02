def block_word?(string)
  hsh = {["b", "o"] => 0, ["x", "k"] => 0, ["d", "q"] => 0, ["c", "p"] => 0,
         ["n", "a"] => 0, ["g", "t"] => 0, ["r", "e"] => 0, ["f", "s"] => 0,
         ["j", "w"] => 0, ["h", "u"] => 0, ["v", "i"] => 0, ["l", "y"] => 0,
         ["z", "m"] => 0 }
  string.chars.each do |char|
    hsh.keys.each do |key|
      hsh[key] += 1 if key.include?(char.downcase)
      return false if hsh[key] > 1
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true