class Person
  @@number_people = 0
  attr_accessor :name, :weight, :height

  def initialize(name, weight, height)
    @name = name
    @weight = weight
    @height = height
    @@number_people += 1
  end

  def change_info(name, weight, height)
    self.name = name
    self.weight = weight
    self.height = height
  end

  def self.total_people
    @@number_people
  end
  
  def self.other
    self
  end
end

bob = Person.new('bob', 185, 70)
Person.total_people       # 1

p Person.other

bob.name # => Bob
bob.weight # => 185
bob.height # => 70

bob.change_info('Robert', 170, 71)
p bob.name # => Robert
p bob.weight # => 170
p bob.height # => 71