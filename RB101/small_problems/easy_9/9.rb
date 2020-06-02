def get_grade(g1, g2, g3)
  average = (g1 + g1 + g3) / 3
  case average
  when (90..100) then 'A'
  when (80...90) then 'B'
  when (70...80) then 'C'
  when (60...70) then 'D'
  else                'E'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"