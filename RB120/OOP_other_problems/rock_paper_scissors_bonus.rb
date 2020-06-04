require "pry"

MOVES = %w(rock paper scissors)

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
  attr_accessor :move, :name
  
  def initialize
    set_name
  end
end

class Human < Player
  
  def set_name
    puts "\nPlease enter a name."
    answer = ""
    loop do
      answer = gets.chomp
       break unless answer.empty?
       puts "\nSorry, you must enter a name."
     end
    self.name = answer
  end
  
  def choose
    choice = nil
    loop do
      puts "\nPlease pick rock, paper, or scissors."
      choice = gets.chomp
      break if MOVES.include? (choice)
      puts "\nSorry, invalid choice."
    end
    self.move = Move.new(choice)
    puts "\n#{name} picks #{choice}."
    puts ""
  end
  
end

class Computer < Player

  def set_name
    self.name = (["Hal the almost predictable", "C3PO the single-minded"] + 
    ["R2D2 the stubborn", "Wall-E the persistent", "Asimov the invicible"] +
    [%("This AI that will rule the world unless you beat it, no pressure")]).sample
  end

  def choose(human_move)
    if name == "C3PO the single-minded"
      choice = "rock"
    elsif name == "R2D2 the stubborn"
      choice = "scissors"
    elsif name == "Wall-E the persistent"
      choice = "paper"
    elsif name == "Hal the almost predictable"
      choice = (["rock"] * 7 + ["scissors"] * 2 + ["paper"]).sample
    elsif name == "Asimov the invicible"
      choice = asimov_chooses(human_move.to_s)
    else
      choice = MOVES.sample
    end
    
    self.move = Move.new(choice)
    puts "#{name} picks #{choice}.\n"
  end
  
  def asimov_chooses(opponent_move)
    if opponent_move == "paper"
      "scissors"
    elsif opponent_move == "rock"
      "paper"
    else
      "rock"
    end
  end
  
  def display_opponent
    puts "\nYour opponent will be #{self.name}! Good luck!"
  end
end

class RPS_game
  @@human_score = 0
  @@computer_score = 0
  
  attr_accessor :human, :computer
  
  def clear
    system 'clear'
  end
  
  def wait
    sleep 2
  end
  
  def initialize
    clear
    @human = Human.new
    @computer = Computer.new
  end
  
  def welcome_message
    puts "\nWelcome to Rock, Paper, Scissors."
  end
  
  def good_by_message
    puts "\nThanks for playing. Good bye."
  end
  
  def compare
    if human.move > computer.move
      puts "\n#{human.name} won!"
      @@human_score += 1
      
    elsif computer.move > human.move
      puts "\n#{computer.name} won!"
      @@computer_score += 1
    else
      puts "\nIt's a tie!"
    end
  end
  
  def display_score
    puts "\n#{human.name} has #{@@human_score} points. #{computer.name} has #{@@computer_score} points."
  end
  
  def display_grand_winner
    if @@human_score == 10
      puts "\nWith a score of 10 against #{@@computer_score}, #{human.name} wins!"
    else puts "\nWith a score of 10 against #{@@human_score}, #{computer.name} wins!"
      puts
    end
  end
  
  def wanna_play_again?
    puts "\nDo you want to play again? (y/n)"
    answer =  nil
    
    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "\nSorry, you must choose (y/n)"
    end
    answer == 'y'
  end
      
  def play
    welcome_message
    computer.display_opponent
    wait
    loop do
      loop do
        clear
        human.choose
        computer.choose(human.move)
        wait
        compare
        wait
        break if @@human_score == 10 || @@computer_score == 10
        display_score
        wait
      end
      display_grand_winner
      @@human_score = @@computer_score = 0
    break unless wanna_play_again?
    end
    good_by_message
  end
end

RPS_game.new.play
