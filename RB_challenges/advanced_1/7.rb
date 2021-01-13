class Matrix
  attr_reader :columns, :rows, :saddle_points
  
  def initialize(str)
    @rows = str.split("\n").map { |x| x.split(" ").map(&:to_i) }
    @columns = rows.transpose
    @saddle_points = determine_saddle_points
  end
  
  private
  
  def determine_saddle_points
    @rows.each.with_index.with_object([]) do |(row, idx_row), saddle|
      row.each_with_index do |x, idx_column|
        saddle << [idx_row, idx_column] if x == row.max && x == @columns[idx_column].min
      end
    end
  end
end
