class Triangle
  attr_accessor :rows
  
  def initialize(rank)
    @rank = rank
    @rows = []
    create_rows
  end 
  
  def create_rows
    self.rows = [[1]]
    return if @rank == 1
    rows << [1, 1]
    until rows.size == @rank do
      new_row = [1]
      rows.last.each_cons(2) { |numbers| new_row << numbers.sum }
      new_row << 1
      rows << new_row
    end
  end
end

