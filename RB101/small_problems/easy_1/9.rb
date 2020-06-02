def sum(number)
  number.to_s.chars.map(&:to_i).sum 
end
