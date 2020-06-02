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
    puts "Please enter a name.\n"
    answer = ""
    loop do
      answer = gets.chomp
       break unless answer.empty?
       puts "Sorry, you must enter a name.\n"
     end
    self.name = answer
  end
  
  def choose
    choice = nil
    loop do
      puts "Please pick rock, paper, or scissors.\n"
      choice = gets.chomp
      break if MOVES.include? (choice)
      puts "Sorry, invalid choice.\n"
    end
    self.move = Move.new(choice)
    puts "\n#{name} picks #{choice}.\n"
    puts ""
  end
  
end

class Computer < Player

  def set_name
    self.name = ["Hal", "C3PO", "R2D2", "Wall-E", "Asimov", %("This AI that will rule the world unless you beat it, no pressure")].sample
  end

  def choose(human_move)
    if name == "C3PO"
      choice = "rock"
    elsif name == "Hal"
      choice = (["rock"] * 8 + ["scissors"] + ["paper"]).sample
    elsif name == "R2D2"
      choice = "scissors"
    elsif name == "Wall-E"
      choice = "paper"
    elsif name == "Asimov"
      if human_move.to_s == "paper"
        choice = "scissors"
      elsif human_move.to_s == "rock"
        choice = "paper"
      else
        choice = "rock"
      end
    else
      choice = MOVES.sample
    end
    self.move = Move.new(choice)
    puts "#{name} picks #{choice}.\n"
  end
end

class RPG_game
  @@human_score = 0
  @@computer_score = 0
  
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def welcome_message
    puts "Welcome to Rock, Paper, Scissors.\n"
  end
  
  def good_by_message
    puts "\nThanks for playing. Good bye."
  end
  
  def compare
    if human.move > computer.move
      puts "#{human.name} won!\n"
      @@human_score += 1
      
    elsif computer.move > human.move
      puts "#{computer.name} won!\n"
      @@computer_score += 1
    else
      puts "It's a tie!\n"
    end
  end
  
  def display_score
    puts "\n#{human.name} has #{@@human_score} points. #{computer.name} has #{@@computer_score} points.\n"
  end
  
  def display_grand_winner
    if @@human_score == 10
      puts "\nWith a score of 10 against #{@@computer_score}, #{human.name} wins!"
    else puts "\nWith a score of 10 against #{@@human_score}, #{computer.name} wins!"
      puts
    end
  end
  
  def wanna_play_again?
    puts "\nDo you want to play again? (y/n)\n"
    answer =  nil
    
    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "Sorry, you must choose (y/n)\n"
    end
    answer == 'y'
  end
      
  def play
    welcome_message
    loop do
      loop do
        human.choose
        computer.choose(human.move)
        compare
        break if @@human_score == 10 || @@computer_score == 10
        display_score
      end
      display_grand_winner
    break unless wanna_play_again?
    @@human_score = @@computer_score = 0
    end
    good_by_message
  end
end

RPG_game.new.play
