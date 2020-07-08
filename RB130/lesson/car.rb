class Vehicle ; end

class Car < Vehicle
  attr_accessor :wheels, :name, :colour

  def initialize(name)
    @wheels = 4
    @name = name
  end
 
 def ==(other)
   other.is_a?(Car) && name == other.name
 end
end

