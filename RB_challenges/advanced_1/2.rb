class Triplet
  attr_reader :sum, :product
  
  def initialize(first, second, third)
    @triplet = [first, second, third]
    @sum = @triplet.sum
    @product = @triplet.reduce(:*)
  end
  
  def pythagorean?
    @triplet[0] ** 2 + @triplet[1] ** 2 == @triplet[2] ** 2
  end
  
  def self.where(sum: nil, min_factor: 1, max_factor:)
    result = [*min_factor..max_factor].combination(3).to_a.map do |tri| 
      Triplet.new(tri[0], tri[1], tri[2])
    end
    result.select! { |triplet| triplet.sum == sum } if sum
    result.select { |triplet| triplet.pythagorean? }
  end
end
