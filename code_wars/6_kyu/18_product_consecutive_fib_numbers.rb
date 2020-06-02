def productFib(prod)
  a = b = 1
  loop do
    return [a, b, true] if (a * b) == prod
    return [a, b, false] if (a * b) > prod
    b, a = b + a, b
  end
end

p productFib(4895) == [55, 89, true]
p productFib(5895) == [89, 144, false]
