class GuessingGame
  NUMBER_RANGE = (1..100).to_a
  GUESS_NUMBER = 7
  
  def play
    loop do
      remaining_guesses
      attempt = enter_number_loop
      display_result(attempt)
    break if stop_game?
    end
    display_final_result
  end
  
  private
  
  def initialize
    @number = NUMBER_RANGE.sample
    @guesses = GUESS_NUMBER
    @min = NUMBER_RANGE.min
    @max = NUMBER_RANGE.max
    @winner = false
  end
  
  def remaining_guesses
    print "\nYou have #{@guesses} guesses remaining."
    @guesses -= 1
  end
  
  def enter_number_loop
    answer = nil
    puts ""
    loop do
      print "Enter a number between #{@min} and #{@max}:"
      answer = gets.chomp.to_i
      break if NUMBER_RANGE.include? answer
      puts "Invalid guess."
    end
    answer
  end
  
  def display_result(attempt)
    if attempt < @number
      puts "Your guess is too low."
    elsif attempt > @number
      puts "Your guess is too high."
    else
      @winner = true
      puts "That's the number!"
    end
  end
  
  def stop_game?
    @winner || @guesses == 0
  end
  
  def display_final_result
    if @winner
      puts "\nYou won!"
    else
      puts "\nYou have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new
game.play