class Bst
  attr_reader :data, :right, :left
  
  def initialize(num)
    @data = num
  end
  
  def insert(num)
    if num > data
      right.nil? ? @right = Bst.new(num) : right.insert(num)
    else
      left.nil? ? @left = Bst.new(num) : left.insert(num)
    end
  end
  
  def each(&block)
    to_a.each(&block)
  end

  def to_a
    [left.to_a, data, right.to_a].flatten
  end
end
