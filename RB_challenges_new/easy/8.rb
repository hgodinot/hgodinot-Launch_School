class SumOfMultiples
  def self.to(n)
    self.new.to(n)
  end
  
  def initialize(*args)
    @multiples = args[0]? args : [3, 5]
  end

  def to(num)
    (1..num - 1).select do |x| 
      @multiples.any? { |multiple| x % multiple == 0}
    end.sum
  end
end
