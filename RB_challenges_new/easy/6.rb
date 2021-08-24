class PerfectNumber
  def initialize(num)
    raise ArgumentError.new "Argument must be an integer > 0" unless num.class == Integer && num > 0
    @num = num
  end

  def classify
    sum_divisors = determine_divisors(@num).sum
    if @num == sum_divisors
      "perfect"
    elsif @num < sum_divisors
      "abundant"
    else
      "deficient"
    end
  end

  private

  def determine_divisors(num)
    (1..(num-1)).select { |x| num % x == 0 }
  end

end
