def zeros(n)
  sum = 1
  1.upto(n) do |x|
    sum = sum * x.divmod(10)[1]
    sum = sum.divmod(10)[1]
  end
  sum
end

p zeros(12) == 2
p zeros(6) == 1