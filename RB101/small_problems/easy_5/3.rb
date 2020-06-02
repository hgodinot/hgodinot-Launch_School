def after_midnight(time)
  result = (time[0,2].to_i)*60 + time[3,2].to_i
  result = 0 if result == 1440
  result
end

def before_midnight(time)
  result = 1440 - after_midnight(time)
  result = 0 if result == 1440
  result
end
