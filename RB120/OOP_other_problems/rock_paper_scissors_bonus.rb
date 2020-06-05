MOVES = %w(rock paper scissors)
ROUNDS_TO_WIN = 2

class Move
  def initialize(value)
    @value = value
  end

  def rock?
    @value.downcase == "rock"
  end

  def paper?
    @value.downcase == "paper"
  end

  def scissors?
    @value.downcase == "scissors"
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      scissors? && other_move.paper? ||
      paper? && other_move.rock?
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def wins_match?
    score == ROUNDS_TO_WIN
  end
end

class Human < Player
  def set_name
    puts "\nPlease enter a name."
    answer = ""
    loop do
      answer = gets.chomp
      if answer.size < 2
        puts "\nSorry, you must enter a name, at least two characters."
      else
        break
      end
    end
    self.name = answer
  end

  def choose
    conversion = { "r" => "rock", "p" => "paper", "s" => "scissors" }
    choice = nil
    loop do
      puts "\nPlease pick rock, paper, or scissors (r/p/s)."
      choice = conversion[gets.chomp.downcase]
      break if MOVES.include? choice
      puts "\nSorry, invalid choice. Pick 'r', 's', or 'p'."
    end
    self.move = Move.new(choice)
    puts "\n#{name} picks #{choice}."
    puts ""
  end
end

class Computer < Player
  def choose(choice)
    self.move = Move.new(choice)
    display_computer_move(name, choice)
  end

  def display_computer_move(name, choice)
    puts "#{name} picks #{choice}.\n"
  end

  def display_opponent
    puts "\nYour opponent will be #{name}! Good luck!"
  end
end

class Hal < Computer
  def set_name
    self.name = "Hal the almost predictable"
  end

  def choose(*)
    choice = (["rock"] * 7 + ["scissors"] * 2 + ["paper"]).sample
    super(choice)
  end
end

class C3PO < Computer
  def set_name
    self.name = "C3PO the single-minded"
  end

  def choose(*)
    choice = "scissors"
    super(choice)
  end
end

class R2D2 < Computer
  def set_name
    self.name = "R2D2 the stubborn"
  end

  def choose(*)
    choice = "rock"
    super(choice)
  end
end

class WallE < Computer
  def set_name
    self.name = "Wall-E the persistent"
  end

  def choose(*)
    choice = "paper"
    super(choice)
  end
end

class Asimov < Computer
  def set_name
    self.name = "Asimov the invicible"
  end

  def choose(opponent_move)
    if opponent_move == "paper"
      choice = "scissors"
    elsif opponent_move == "rock"
      choice = "paper"
    else
      choice = "rock"
    end
    super(choice)
  end
end

class AI < Computer
  def set_name
    self.name = "This AI that will rule the world unless you beat it, no pressure"
  end

  def choose(*)
    choice = MOVES.sample
    super(choice)
  end
end

class RPSGame
  PERSONNALITIES = [Hal, C3PO, R2D2, WallE, Asimov, AI]
  attr_accessor :human, :computer

  def play
    welcome_message
    computer.display_opponent
    wait
    loop do
      game_match
      display_grand_winner
      reset_score
      break unless wanna_play_again?
    end
    good_by_message
  end

  private

  def game_match
    loop do
      human.choose
      computer.choose(human.move)
      wait
      compare
      display_score
      wait
    break if match_ended?
    end
    wait
  end

  def match_ended?
    human.wins_match? || computer.wins_match?
  end

  def reset_score
    human.score = computer.score = 0
  end

  def clear
    system 'clear'
  end

  def wait
    sleep 2
  end

  def initialize
    clear
    @human = Human.new
    @computer = (PERSONNALITIES.sample).new
  end

  def welcome_message
    puts "\nWelcome to Rock, Paper, Scissors. " +
         "First player to #{ROUNDS_TO_WIN} wins."
  end

  def good_by_message
    puts "\nThanks for playing. Good bye."
  end

  def compare
    if human.move > computer.move
      puts "\n#{human.name} won!"
      human.score += 1
    elsif computer.move > human.move
      puts "\n#{computer.name} won!"
      computer.score += 1
    else
      puts "\nIt's a tie!"
    end
  end

  def display_score
    puts "\n#{human.name} has #{human.score} points. " +
         "#{computer.name} has #{computer.score} points."
  end

  def display_grand_winner
    if human.wins_match?
      puts "\nWith a score of #{ROUNDS_TO_WIN} against " +
           "#{computer.score}, #{human.name} is the grand winner!"
    else
      puts "\nWith a score of #{ROUNDS_TO_WIN} against " +
           "#{human.score}, #{computer.name} is the grand winner!"
    end
  end

  def wanna_play_again?
    puts "\nDo you want to play again? (y/n)"
    answer = nil

    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "\nSorry, you must choose (y/n)"
    end
    answer == 'y'
  end
end

RPSGame.new.play
