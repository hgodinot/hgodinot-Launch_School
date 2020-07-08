class Player
  attr_accessor :position, :winner
  attr_reader :name
  
  def initialize(name)
    @position = 0
    @name = name
    @winner = false
  end
  
  def moves(dice1, dice2)
    self.position = dice1 + dice2 + position
    if position > 100
      self.position = 100 - (position - 100)
    end
  end
end

class SnakesLadders
  SNAKES = {16 => 6, 46 => 25, 49 => 11, 62 => 19, 64 => 60, 74 => 53,
            89 => 68, 92 => 88, 95 => 75, 99 => 80 }
  LADDERS = {2 => 38, 7 => 14, 8 => 31, 15 => 26, 21 => 42, 28=> 84,
             36 => 44, 51 => 67, 71 => 91, 78 => 98, 87 => 94 }
  GOAL = 100
  
  attr_accessor :player1, :player2, :current_player
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def play(dice1, dice2)
    current_player_plays(dice1, dice2)
    snake_or_ladder
    result = determine_result
    switch_players(dice1, dice2)
    result
  end
  
  def current_player_plays(dice1, dice2)
    if current_player == player1 && player2.winner ||
       current_player == player2 && player1.winner
    else
      current_player.moves(dice1, dice2)
    end
  end
  
  def snake_or_ladder
    if SNAKES.has_key?(current_player.position)
      current_player.position = SNAKES[current_player.position]
    elsif LADDERS.has_key?(current_player.position)
      current_player.position = LADDERS[current_player.position]
    end
  end
  
  def determine_result
    if current_player.position == 100
      current_player.winner = true
      result = "#{current_player.name} Wins!"
    elsif current_player == player1 && player2.winner ||
          current_player == player2 && player1.winner
      result = "Game over!"
    else
      result = "#{current_player.name} is on square #{current_player.position}"
    end
    result
  end

  def switch_players(dice1, dice2)
    return if dice1 == dice2 && !current_player.winner
    if current_player == player1 && !player2.winner
      self.current_player = player2
    elsif current_player == player2 && !player1.winner
      self.current_player = player1
    end
  end
end

game = SnakesLadders.new

p game.play(1, 2)
p game.play(50, 50)
p game.play(2, 1)
