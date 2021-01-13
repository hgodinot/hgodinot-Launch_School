def staggered_case(string)
  idx = 0
  string.chars.map do |char|
    if !!/[a-zA-Z]/.match(char)
      idx += 1
      idx.odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'