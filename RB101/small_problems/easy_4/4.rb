def leap_year?(year)
  (year <= 1752 && year % 4 == 0) ||
  (year > 1752 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
end

=begin
def leap_year_post_1752?(number)
  return true if number % 400 == 0
  return false if number % 100 == 0
  return true if number % 4 == 0
  false
end

def leap_year?(number)
  if number > 1752
    return (leap_year_post_1752?(number))
  elsif number % 4 == 0
    return true
  end
  false
end
=end

