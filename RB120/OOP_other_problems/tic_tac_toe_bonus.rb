class Player
  MARKERS = %w(X O @ £ €)
  attr_accessor :winner, :victories, :marker, :name, :current_player

  def initialize(marker, name)
    @marker = marker
    @name = name
    @winner = nil
    @victories = 0
    @current_player = false
  end

  def add_victory_and_score
    self.winner = true
    self.victories += 1
  end
end

class Human < Player
  def initialize
    super(pick_marker, pick_name)
  end

  def pick_marker
    marker = nil
    loop do
      puts "\nPlease pick your marker between #{MARKERS.join(', ')}!"
      marker = gets.chomp
      break if MARKERS.include? marker
      puts "\nSorry incorrect choice."
    end
    marker
  end

  def pick_name
    name = ""
    loop do
      puts "\nPlease pick a name."
      name = gets.chomp.capitalize
      break if name.size >= 2 && name.size <= 15
      puts "\nSorry, incorrect choice. 2 characters min, 15 characters max."
    end
    name
  end
end

class Computer < Player
  def initialize(opponent_marker)
    marker = (MARKERS - [opponent_marker]).sample
    name = %w(C3PO R2D2 Asimov Hal Wall_E Terminator Bishop).sample
    super(marker, name)
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  EMPTY_MARKER = " "

  attr_accessor :grid, :human, :computer

  def initialize(human, computer)
    @grid = {}
    @human = human
    @computer = computer
    reset
  end

  def reset
    (1..9).each { |x| grid[x] = EMPTY_MARKER }
  end

  def empty_spaces
    grid.select { |_, v| v == EMPTY_MARKER }.keys
  end

  def full?
    empty_spaces.empty?
  end

  def someone_won?
    WINNING_LINES.each do |line|
      if human_wins?(line)
        human.add_victory_and_score
        return true
      elsif computer_wins?(line)
        computer.add_victory_and_score
        return true
      end
    end
    false
  end

  def joiner(arr, join)
    if arr.size > 1
      "#{arr[0..-2].join("#{join} ")} or #{arr[-1]}."
    else
      "#{arr[-1]} (not much of a choice)."
    end
  end

  def human_wins?(line)
    grid[line[0]] + grid[line[1]] + grid[line[2]] == human.marker * 3
  end

  def computer_wins?(line)
    grid[line[0]] + grid[line[1]] + grid[line[2]] == computer.marker * 3
  end
end

class TTTGame
  MAX_VP = 5
  attr_reader :board, :human, :computer

  def play
    loop do
      who_starts?
      total_reset
      display_board
      play_rounds
      break if game_over?
      break unless play_again?
    end
    good_bye_message
  end

  private

  def initialize
    clear
    welcome_message
    @human = Human.new
    @computer = Computer.new(human.marker)
    @board = Board.new(@human, @computer)
  end

  def total_reset
    board.reset
    human.winner = nil
    computer.winner = nil
  end

  def play_rounds
    loop do
      current_player_round
      break if game_stops?
      display_board
    end

    display_board
    display_result
  end

  def game_stops?
    board.someone_won? || board.full?
  end

  def welcome_message
    puts "\nWelcome to Tic-Tac-Toe! First player at #{MAX_VP} points wins!"
  end

  def good_bye_message
    puts "\nThanks for playing Tic-Tac-Toe! Good-bye!"
  end

  def clear
    system 'clear'
  end

  def who_starts?
    human.current_player = false
    computer.current_player = false
    choice = player_chooses_who_starts

    case choice
    when "1" then human.current_player = true
    when "2" then computer.current_player = true
    else
      random_start_choice
    end
  end

  def random_start_choice
    rand(2) == 0 ? human.current_player = true : computer.current_player = true
  end

  def player_chooses_who_starts
    choice = nil
    loop do
      puts "\nDo you want to start (1), let computer starts (2), " \
           "or decide randomly (3)?"
      choice = gets.chomp
      break if %w(1 2 3).include? choice
      puts "\nIncorrect choice, please pick 1, 2 or 3."
    end
    choice
  end

  def display_board
    clear
    puts "\n     |     |     "
    puts "  #{board.grid[1]}  |  #{board.grid[2]}  |  #{board.grid[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.grid[4]}  |  #{board.grid[5]}  |  #{board.grid[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.grid[7]}  |  #{board.grid[8]}  |  #{board.grid[9]}  "
    puts "     |     |     "
    puts "\nYou're #{human.marker}. Computer is #{computer.marker}."
  end

  def current_player_round
    human.current_player ? human_plays : computer_plays
    switch_current_player
  end

  def switch_current_player
    human.current_player = !human.current_player
    computer.current_player = !computer.current_player
  end

  def human_plays
    choice = nil
    loop do
      puts "\nWhere do you want to play? Choose between " \
           "#{board.joiner(board.empty_spaces, ',')}"
      choice = gets.chomp.to_i
      break if board.empty_spaces.include? choice
      puts "\nSorry, incorrect choice."
    end
    board.grid[choice] = human.marker
  end

  def computer_plays
    choice = attack_opportunity?
    choice ||= threat?
    choice ||= five_or_random_move
    board.grid[choice] = computer.marker
  end

  def attack_opportunity?
    Board::WINNING_LINES.each do |line|
      if find_line?(line, computer.marker)
        (0..2).each do |idx|
          if board.grid[line[idx]] == Board::EMPTY_MARKER
            return line[idx]
          end
        end
      end
    end
    nil
  end

  def threat?
    Board::WINNING_LINES.each do |line|
      if find_line?(line, human.marker)
        (0..2).each do |idx|
          if board.grid[line[idx]] == Board::EMPTY_MARKER
            return line[idx]
          end
        end
      end
    end
    nil
  end

  def find_line?(line, marker)
    (board.grid[line[0]] + board.grid[line[1]] +
    board.grid[line[2]]).chars.sort.join == Board::EMPTY_MARKER + marker * 2
  end

  def five_or_random_move
    board.grid[5] == Board::EMPTY_MARKER ? 5 : board.empty_spaces.sample
  end

  def play_again?
    if player_keeps_playing?
      puts "\nLet's play again!"
      return true
    end
    false
  end

  def player_keeps_playing?
    choice = nil
    loop do
      puts "\nDo you want to keep playing ? (y/n)"
      choice = gets.chomp
      break if %w(y n).include? choice
      puts "\nSorry, wrong choice."
    end
    clear
    choice == "y"
  end

  def game_over?
    if human.victories == MAX_VP || computer.victories == MAX_VP
      display_grand_winner
      return true
    end
    false
  end

  def display_result
    display_round_result
    display_score
  end

  def display_round_result
    if human.winner
      puts "\nCongratulations, #{human.name} won!"
    elsif computer.winner
      puts "\nSorry, #{computer.name} won!"
    else
      puts "\nIt's a tie!"
    end
  end

  def display_score
    puts "\n#{human.name} #{human.victories} has point(s). #{computer.name} " \
         "has #{computer.victories} point(s)."
  end

  def display_grand_winner
    if human.winner
      first = human
      second = computer
    else
      first = computer
      second = human
    end
    puts "\n#{first.name} is the grand winner with #{first.victories} " \
         "point(s) against #{second.victories} for #{second.name}."
  end
end

game = TTTGame.new
game.play
