class Bst
  
  attr_accessor :data, :left, :right
  
  def initialize(first_number)
    @data = first_number
  end
  
  def insert(number)
    if number > data
      right.nil? ? self.right = Bst.new(number) : right.insert(number)
    else
      left.nil? ? self.left = Bst.new(number) : left.insert(number)
    end
  end
  
  def each
    #A reprendre
  end

end
