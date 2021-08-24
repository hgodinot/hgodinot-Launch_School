class PerfectNumber
  def self.factors(n)
    (1..n/2).select { |x| n % x == 0 }
  end
  
  def self.classify(num)
    raise RuntimeError if num < 1 || num.class != Integer
    sum = factors(num).sum

    case
    when sum == num then 'perfect'
    when sum > num then 'abundant'
    else 'deficient'
    end
  end
end

# Shorter but harder to understand code
=begin

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1 || number.class != Integer
    sum = (1..number/2).select { |x| number % x == 0 }.sum
    return 'perfect' if sum == number
    return 'abundant' if sum > number
    'deficient'
  end
end

=end