class Cat
  @@cat_number = 0
  
  def initialize
    @@cat_number += 1
  end
  
  def self.total
    puts @@cat_number
  end
end


kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
