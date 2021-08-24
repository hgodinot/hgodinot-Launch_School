def string_letter_count(string)
  hsh = {}
  result = ""
  string.chars.each do |char|
    if ("a".."z").include?(char.downcase)
      hsh[char.downcase] += 1 if hsh[char.downcase] != nil
      hsh[char.downcase] = 1 if hsh[char.downcase] == nil
    end
  end
  hsh.sort.each { |key, value| result << (value.to_s + key ) }
  result
end


p string_letter_count("This is a test sentence.") == "1a1c4e1h2i2n4s4t"
p string_letter_count("") == ""
p string_letter_count("555") == ""
p string_letter_count("The quick brown fox jumps over the lazy dog.") == "1a1b1c1d3e1f1g2h1i1j1k1l1m1n4o1p1q2r1s2t2u1v1w1x1y1z"
p string_letter_count("The time you enjoy wasting is not wasted time.") == "2a1d5e1g1h4i1j2m3n3o3s6t1u2w2y"
p string_letter_count("./4592#{}()") == ""