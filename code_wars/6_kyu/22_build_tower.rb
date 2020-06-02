def towerBuilder(n_floors)
  result = []
  1.upto(n_floors) do |x|
    result << ( " " * (n_floors - x) + "*" * (x * 2 - 1) + " " * (n_floors - x) )
  end
  result
end

p towerBuilder(1) == ['*']
p towerBuilder(2) == [' * ', '***']
p towerBuilder(3) == ['  *  ', ' *** ', '*****']


[
  '     *     ', 
  '    ***    ', 
  '   *****   ', 
  '  *******  ', 
  ' ********* ', 
  '***********'
]