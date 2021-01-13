def leap_year?(number)
  return true if number % 400 == 0
  return false if number % 100 == 0
  number % 4 == 0
end

