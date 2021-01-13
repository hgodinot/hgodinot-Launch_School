class Triangle
  attr_reader :rows
  def initialize(size)
    @rows = [[1]]
    (size - 1).times do
       @rows << @rows.last.each_cons(2).to_a.map { |arr| arr.reduce(:+) }.unshift(1).push(1)
    end
  end
end

# Other way to do it

class Triangle
  attr_reader :rows
  
  def initialize(size)
    @size = size
    @rows = [[1]]
    (size - 1).times { |num| generate_row(num + 2) }
  end
  
  def generate_row(num)
    @rows << Array.new(num).map.with_index do |_, idx|
      [0, num - 1].include?(idx) ? 1 : @rows.last[idx] + @rows.last[idx - 1] 
    end
  end
end