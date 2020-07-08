class Robot
  attr_accessor :name
  @@robot_names = []
  
  def initialize
    @name = give_name
    @@robot_names << name
  end
  
  def give_name(previous_name = "")
    name = ""
    loop do
      name = [*'AA'..'ZZ'].sample + [*'000'..'999'].sample
      break if !@@robot_names.include?(name) && name != previous_name
    end
    name
  end
  
  def reset
    @@robot_names.delete(name)
    self.name = give_name(name)
  end
end
