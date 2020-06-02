def  first_non_repeating_letter(s)
  s = s.chars
  s.select! { |char| s.map(&:downcase).count(char.downcase) == 1 }
  return "" if s.length == 0
  s[0]
end

p first_non_repeating_letter('a') == 'a'
p first_non_repeating_letter('sTress') == 'T'
p first_non_repeating_letter('moonmen') == 'e'
p first_non_repeating_letter('') == ''
