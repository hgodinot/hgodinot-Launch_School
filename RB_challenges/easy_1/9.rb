class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 1 || number.class != Integer
    sum = (1..(number/2)).select { |x| number % x == 0 }.sum
    return 'perfect' if sum == number
    return 'abundant' if sum > number
    'deficient'
  end
end