def time_of_day(number)
  total_minutes = number % 1440
  hours, minutes = total_minutes.divmod(60)
  format('%02d:%02d', hours, minutes)
end
