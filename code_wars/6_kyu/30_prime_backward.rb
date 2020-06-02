def is_prime?(n)
  return false if n.even? && n != 2
  2.upto(n - 1) do |i|
    return false if n % i == 0
  end
  true
end


def backwardsPrime(start, stop)
  result = []
  start.upto(stop) do |x|
    if is_prime?(x)
      if x.digits.join.to_i != x
        if is_prime?(x.digits.join.to_i)
          result << x
        end
      end
    end
  end
  return 0 if result == []
  result
end

p backwardsPrime(7000, 7100) == [7027, 7043, 7057]