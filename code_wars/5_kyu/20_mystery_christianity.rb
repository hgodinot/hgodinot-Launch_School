class God
  attr_reader :value
  def initialize
    @value = 1
  end
  
  def +(other)
    value
  end
  
  def coerce(other)
    [value, other - 1]
  end
end




father = God.new
son = God.new
holy_spirit = God.new

puts father + son + holy_spirit


