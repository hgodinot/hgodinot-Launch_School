def century_number(num)
  century, remainder = num.divmod(100)
  century += 1 if remainder > 0
  century.to_s
end

def century_string(num)
  return "th" if ["11", "12", "13"].include?(num[-2, 2])
  
  case num[-1]
  when "1" then "st"
  when "2" then "nd"
  when "3" then "rd"
  else "th"
  end
end

def century(year)
  century_number(year) + century_string(century_number(year))
end
