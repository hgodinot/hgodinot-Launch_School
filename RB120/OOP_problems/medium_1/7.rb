class GuessingGame
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
  
  def initialize(val1, val2)
    @range = determine_range(val1, val2)
    @number = @range.sample
    @guesses = Math.log2(@range.size).to_i + 1
    @min = @range.min
    @max = @range.max
    @winner = false
  end
  
  def determine_range(val1, val2)
    if val2 > val1
      (val1..val2).to_a
    elsif val1 > val2
      (val2..val1).to_a
    else
      [val1] #This sould not happen, both values are supposed to be different.
    end
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
      break if @range.include? answer
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

game = GuessingGame.new(501, 1500)
game.play
