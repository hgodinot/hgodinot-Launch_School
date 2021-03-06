def friday_13th(year)
  (1..12).map { |month| Time.local(year, month, 13).friday? }.count(true)
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2