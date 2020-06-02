require "pry"

class Player
  attr_accessor :winner, :victories
  
  def initialize(marker)
    @marker = marker
    @winner = nil
    @victories = 0
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
  EMPTY_MARKER = " "
  
  attr_accessor :markers, :human, :computer
  
  def initialize(human, computer)
    @markers = {}
    @human = human
    @computer = computer
    reset
  end
  
  def reset
    (1..9).each {|x| markers[x] = EMPTY_MARKER}
  end
    
  
  def empty_spaces
    markers.select {|k, v| v == EMPTY_MARKER }.keys
  end
  
  def full?
    empty_spaces.size == 0
  end
  
  def someone_won?
    WINNING_LINES.each do |sub|
      if markers[sub[0]] + markers[sub[1]] + markers[sub[2]] == TTT_game::HUMAN_MARKER * 3
        human.winner = true
        human.victories += 1
        return true
      elsif markers[sub[0]] + markers[sub[1]] + markers[sub[2]] == TTT_game::COMPUTER_MARKER * 3
        computer.winner = true
        computer.victories += 1
        return true
      end
    end
    nil
  end
  
  def joiner(arr)
    if arr.size > 1
      "#{arr[0..-2].join(", ")} or #{arr[-1]}."
    else
      "#{arr[-1]} (not much of a choice)."
    end
  end

end


class TTT_game
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  attr_reader :board, :human, :computer
  
  
  def initialize
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @board = Board.new(@human, @computer)
  end
  
  def welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts ""
  end
  
  def good_bye_message
    puts ""
    puts "Thanks for playing Tic-Tac-Toe! Good-bye!"
  end
  
  def display_board
    system 'clear'
    puts ""
    puts "     |     |     "
    puts "  #{board.markers[1]}  |  #{board.markers[2]}  |  #{board.markers[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.markers[4]}  |  #{board.markers[5]}  |  #{board.markers[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board.markers[7]}  |  #{board.markers[8]}  |  #{board.markers[9]}  "
    puts "     |     |     "
    puts ""
    puts "You're #{HUMAN_MARKER}. Computer is #{COMPUTER_MARKER}."
    puts ""
  end
  
  def human_plays
    choice = nil
    loop do
      puts ""
      puts "Where do you want to play? Choose between #{@board.joiner(@board.empty_spaces)}"
      choice = gets.chomp.to_i
      break if @board.empty_spaces.include? (choice)
      puts ""
      puts "Sorry, incorrect choice."
    end
    board.markers[choice] = HUMAN_MARKER
  end
  
  def computer_plays
    choice = board.empty_spaces.sample
    board.markers[choice] = COMPUTER_MARKER
  end
  
  def display_result
    puts ""
    if human.winner
      puts "Congratulations, you won!"
    elsif computer.winner
      puts "Sorry, you lost!"
    else
      puts "It's a tie!"
    end
    puts
    puts "You have #{human.victories} victories. Computer has #{computer.victories}."
  end
  
  def play_again?
    choice = nil
    loop do
      puts ""
      puts "Do you want to keep playing ? (y/n)"
      puts ""
      choice = gets.chomp
      break if %w(y n).include? (choice)
      puts ""
      puts "Sorry, wrong choice."
    end
    choice == "y"
  end
  
  def five_victories?
    if human.victories == 5
      puts ""
      puts "Congratulations, you're the grand winner."
      return true
    elsif computer.victories == 5
      puts ""
      puts "Computer is the grand winner."
    end
  end
    
  def play
    welcome_message
    
    loop do
      board.reset
      display_board
      
      loop do
        human_plays
        break if board.someone_won? || board.full?
        
        computer_plays
        break if board.someone_won? || board.full?
        display_board
        
        display_board
      end
      
      display_board
      display_result
      break if five_victories?
      break unless play_again?
      puts "Let's play again!"
      puts ""
    end
    
    good_bye_message
  end
  
end

game = TTT_game.new
game.play
