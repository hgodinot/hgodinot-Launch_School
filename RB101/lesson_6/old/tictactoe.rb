require "pry"

PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(mess)
  puts "=> #{mess}"
end

def generate_hash(hsh)
  (1..9).each do |key|
    hsh[key] = ' '
  end
end

def display_board(brd)
puts ""
puts "     |     |     "
puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
puts "     |     |     "
puts "-----|-----|-----"
puts "     |     |     "
puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
puts "     |     |     "
puts "-----|-----|-----"
puts "     |     |     "
puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
puts "     |     |     "
puts ""
end

def player_plays(remaining_slots, hsh)
  answer = ''
  loop do
    prompt("Choose an empty slot to put your marker: #{joinor(remaining_slots)}.")
    answer = gets.chomp.to_i
    break if remaining_slots.include?(answer)
    prompt("Invalid answer, please type again")
  end
  hsh[answer] = PLAYER_MARKER
  remaining_slots.delete(answer)
end

def computer_plays(remaining_slots, hsh)
  answer = remaining_slots.sample
  hsh[answer] = COMPUTER_MARKER
  remaining_slots.delete(answer)
end

def is_a_winner?(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9] , 
                   [1, 5, 9], [3, 5, 7]          ]
  winning_lines.each do |arr|
    return "player" if brd[arr[0]] == PLAYER_MARKER && brd[arr[1]] == PLAYER_MARKER && brd[arr[2]] == PLAYER_MARKER
    return "computer" if brd[arr[0]] == COMPUTER_MARKER && brd[arr[1]] == COMPUTER_MARKER && brd[arr[2]] == COMPUTER_MARKER
  end
end

def is_a_tie?(arr)
  arr == []
end

def joinor(arr, connector = ", ", ending = "or")
  if arr.length == 0
    ""
  elsif arr.length == 1
    arr[0]
  else
    arr.first(arr.length - 1).join(connector).to_s + " " + ending + " #{arr.last.to_s}"
  end
end
  
player_score = 0
computer_score = 0

loop do
  empty_slots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  brd = {}
  generate_hash(brd)
  display_board(brd)
  
  loop do
    player_plays(empty_slots, brd)
    computer_plays(empty_slots, brd)
    display_board(brd)
    if is_a_winner?(brd) == "player"
      prompt("Congrats player, you win!")
      player_score += 1
      break
    elsif is_a_winner?(brd) == "computer"
      prompt("Sorry, you lost against computer.")
      computer_score += 1
      break
    elsif is_a_tie?(empty_slots)
      prompt("It's a tie.")
      break
    end
  end
  
  
  if computer_score == 5
    prompt("Computer is the grand winner")
    break
  elsif player_score == 5
    prompt("Congratulations, you're the grand winner")
    break
  else
    prompt("Do you want to play again ? (y to continue)")
    answer = gets.chomp
  break unless answer.start_with?("y")
  end
end

prompt("Goodbye, thank you for playing!")



=begin
Keep score of how many times the player and computer each win. Don't use global 
or instance variables. Make it so that the first player to 5 wins the game.
=end
