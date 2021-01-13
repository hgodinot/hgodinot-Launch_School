class SumOfMultiples
  def initialize(*numbers)
    @multiples = numbers
  end
  
  def to(n)
    (1...n).to_a.select { |val| @multiples.any? { |multiple| val % multiple == 0 } }.sum 
  end
  
  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end
end

# close version

class SumOfMultiples
  def initialize(*num)
    @multiples = num.empty? ? [3, 5] : num
  end
  
  def to(limit)
    (0..limit - 1).select { |x|  @multiples.any? { |y| x % y == 0 } }.sum
  end
  
  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
end
