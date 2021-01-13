def after_midnight(str)
  (str[0, 2].to_i * 60 + str[3, 2].to_i) % 1440
end

def before_midnight(str)
  (1440 - str[0, 2].to_i * 60 - str[3, 2].to_i) % 1440
end