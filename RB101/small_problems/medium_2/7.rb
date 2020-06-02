def friday_13th(year)
  f_count = 0
  (1..12).each { |month| f_count += 1 if Time.local(year, month, 13).friday? }
  f_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2