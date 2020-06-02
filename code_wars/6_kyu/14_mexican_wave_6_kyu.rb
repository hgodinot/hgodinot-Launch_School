def wave(str)
  results = []
  
  str.chars.each_with_index do |char, index|
    if ("a".."z").include?(char.downcase)
      copy = str.downcase
      copy[index] = copy[index].upcase
      results << copy
    end
  end
  
  results
end


p wave("gap") == ["Gap", "gAp", "gaP"]