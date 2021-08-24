def increment_string(input)
  return input + "1" if input[-1].to_i.to_s != input[-1]
  if (0..8).include?(input[-1].to_i)
    input[-1] = (input[-1].to_i + 1).to_s
    return input
  end
  
  input = input.chars
  nine = []
  
  -1.downto(-input.size) do |idx|
    nine << input[idx].to_i if input[idx] == "9"
    if input[idx] != "9"
      (-(idx + 1)).times {|_| input.delete_at(-1)}
      if ("0".."9").include?(input[-1])
        nine.unshift(input.last.to_i)
        input.pop
      end
      return input.join + (nine.join.to_i + 1).to_s
    end
  end
end

p increment_string("foobar099") == "foobar100"
p increment_string('tqoqunhmki879') == "tqoqunhmki880"
p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("") == "1" 
