def string_expansion(string)
  result = ""
  number = nil
  string.chars.each do |char|
    if ("0".."9").include?(char)
      number = char.to_i
    else
      result << char if number == nil
      result << char * number if number != nil
    end
  end
  result
end

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') == 'aaabbbccc'       # correct