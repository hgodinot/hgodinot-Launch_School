def rot13(string)
  down_alphabet = ("a".."y").to_a.unshift("z")
  up_alphabet = ("A".."Y").to_a.unshift("Z")
  string = string.chars
  result = []
  
  string.each do |char|
    if down_alphabet.include?(char)
      result << down_alphabet[(down_alphabet.index(char) + 13) % 26]
    elsif up_alphabet.include?(char)
      result << up_alphabet[(up_alphabet.index(char) + 13) % 26]
    else
      result << char
    end
  end
  
  result.join
end

p rot13("abcdefghijklmnopqrstuvwxyz") == "nopqrstuvwxyzabcdefghijklm"
p rot13("ab-cd") == "no-pq"
p rot13("nOPq") == "aBCd"