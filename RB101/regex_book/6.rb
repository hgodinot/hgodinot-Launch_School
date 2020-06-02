def format_date(string)
  p string.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end 

format_date('2016-06-17') # -> '17.06.2016'
format_date('2016/06/17') # -> '2016/06/17' (no change)