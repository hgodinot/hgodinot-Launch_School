# Number of Proper Fractions with Denominator d

require "pry"
def proper_fractions(n)
  return 0 if n == 1
  count = 0
  1.upto n-1 do |i|
    reduced = (i/(n.to_f)).to_r
    binding.pry
    count += 1 if reduced.denominator == n
  end
  count
end


#p proper_fractions(1) == 0
#p proper_fractions(2) == 1
p proper_fractions(5) #== 4
p proper_fractions(15) #== 8
p proper_fractions(25) #== 20