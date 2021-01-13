class Queens
  attr_reader :white, :black
  
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
    create_board
  end
  
  def create_board
    @board = 8.times.with_object([]) { |_, arr| arr << "_ _ _ _ _ _ _ _" }
    @board[@white.first][white.last * 2] = "W"
    @board[@black.first][black.last * 2] = "B"
  end
  
  def to_s
    @board.join("\n")
  end
  
  def attack?
    diagonals? || row? || column?
  end
  
  def diagonals?
    (black[0] - black[1]).abs == (white[0] - white[1]).abs
  end
  
  def row?
    white.first == black.first
  end
  
  def column?
    white.last == black.last
  end
end