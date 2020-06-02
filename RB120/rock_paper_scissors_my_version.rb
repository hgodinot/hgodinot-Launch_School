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
end

class Player
  attr_accessor :move, :name
  
  def initialize
    set_name
  end
end

class Human < Player
  
  def set_name
    puts "Please enter a name."
    answer = ""
    loop do
      answer = gets.chomp
       break unless answer.empty?
       puts "Sorry, you must enter a name."
     end
    self.name = answer
  end
  
  def choose
    choice = nil
    loop do
      puts "Please pick rock, paper, or scissors."
      choice = gets.chomp
      break if MOVES.include? (choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    puts "#{name} picks #{choice}."
  end
  
end

class Computer < Player

  def set_name
    self.name = ["Hal", "C3PO", "R2D2", "Wall-E", "Asimov", %("This AI that will rule the world unless you beat it, no pressure")].sample
  end

  def choose
    choice = MOVES.sample
    self.move = Move.new(choice)
    puts "#{name} picks #{choice}."
  end
end

class RPG_game
  
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def welcome_message
    puts "Welcome to Rock, Paper, Scissors."
  end
  
  def good_by_message
    puts "Thanks for playing. Good bye."
  end
  
  def compare
    if human.move > computer.move
      puts "#{human.name} won!"
      
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  
  def wanna_play_again?
    puts "Do you want to play again? (y/n)"
    answer =  nil
    
    loop do
      answer = gets.chomp.downcase
      break if ["y", "n"].include?(answer)
      puts "Sorry, you must choose (y/n)"
    end
    answer == 'y'
  end
      
  def play
    welcome_message
    loop do
      human.choose
      computer.choose
      compare
      break unless wanna_play_again?
    end
    good_by_message
  end
end

RPG_game.new.play
