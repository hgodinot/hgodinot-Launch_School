def letter_percentages(str)
  hash = Hash.new
  hash[:lowercase] = (str.scan(/[a-z]/).size.to_f / str.size) * 100
  hash[:uppercase] = (str.scan(/[A-Z]/).size.to_f / str.size) * 100
  hash[:neither] = (str.scan(/[^a-z]/i).size.to_f / str.size) * 100
  hash
end

#

def letter_percentages(string)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    case char
    when ("A".."Z") then hsh[:uppercase] += 1
    when ("a".."z") then hsh[:lowercase] += 1
    else                hsh[:neither] += 1
    end
  end
  
  total = hsh.values.sum.to_f
  hsh.each { |key, value| hsh[key] = ((value/total) * 100).round(2) }
  hsh
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }