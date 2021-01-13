def egyptian(rat)
  result = []
  i = 1
  while rat != 0
    if rat - Rational(1, i) >= 0
      rat -= Rational(1, i)
      result << Rational(1, i).denominator
    end
    i += 1
  end
  result
end

def unegyptian(arr)
  arr.map { |den| Rational(1, den) }.sum.to_r #Optionnal to_r
end
