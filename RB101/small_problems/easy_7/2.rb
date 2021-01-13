def letter_case_count(string)
  hash_count = {}
  hash_count[:lowercase] = string.count("[a-z]")
  hash_count[:uppercase] = string.count("[A-Z]")
  hash_count[:neither] = string.count("^[a-zA-Z]")
  hash_count
end

#

def letter_case_count_bis(str)
  str.chars.each_with_object({lowercase: 0, uppercase: 0, neither: 0}) do |char, hsh|
    case char
    when ("a".."z") then hsh[:lowercase] += 1
    when ("A".."Z") then hsh[:uppercase] += 1
    else                 hsh[:neither] += 1
    end
  end
end



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }