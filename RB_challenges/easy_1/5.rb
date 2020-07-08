class SumOfMultiples
  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end
  
  def initialize(*numbers)
    @multiples = numbers
  end
  
  def to(limit)
    result = []
    1.upto(limit - 1) do |n|
       result << n if @multiples.any? { |multiple| n % multiple == 0 }
    end
    result.sum
  end
end