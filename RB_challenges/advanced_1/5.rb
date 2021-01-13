class ValueError < StandardError; end

class Board
  def self.transform(brd)
   Board.new(brd).transform
  end
    
  def initialize(brd)
    raise ValueError if value_error(brd)
    @board = brd.map { |str| str.chars }
  end
  
  def value_error(arr)
    arr.any? { |str| str.size != arr.first.size || str.match(/[^-\+\*| ]/) } ||
    arr.size > 2 && ![arr.first, arr.last].all? { |str| str.match(/\+-+\+/) }
  end
  
  def transform
    transform_lines
    @board.map(&:join)
  end
  
  def transform_lines
    @board.map!.with_index do |subarray, s_idx|
      subarray.map!.with_index do |val, v_idx| 
        val == " " ? find_mines(s_idx, v_idx) : val
      end
    end
  end
  
  def find_mines(s_idx, v_idx)
    counter = 0
    [-1, 0, 1].product([-1, 0, 1]).each do |line, col|
      counter += 1 if @board[s_idx + line][v_idx + col] == "*"
    end
    counter > 0 ? counter : " "
  end
end
