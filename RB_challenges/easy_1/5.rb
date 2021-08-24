class SumOfMultiples
  def initialize(*num)
    @num = num.empty? ? [3, 5] : num.sort
  end

  def to(limit)
    (@num[0]...limit).select { |n| @num.any? { |x| n % x == 0 } }.sum
  end

  def self.to(n)
    new.to(n)
  end
end


