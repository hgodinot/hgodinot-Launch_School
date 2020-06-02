NEUTRAL_MARKER = "."
HUMAN_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # lines
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYERS = [:human, :computer]

def welcome_message
  puts "Welcome to Tic, Tac Toe!"
end

def select_first_to_play(first_player)
  choice = nil

  loop do
    puts "\nWho will be the first player? 1 for you, 2 for computer, " \
         "3 for random choice."
    choice = gets.chomp
    break if %w(1 2 3).include?(choice)
    puts "\nSorry, incorrect choice."
  end

  case choice
  when "1" then first_player[0] = PLAYERS[0]
  when "2" then first_player[0] = PLAYERS[1]
  when "3" then first_player[0] = PLAYERS.sample
  end
end

# rubocop:disable Metrics/AbcSize
def board_display(brd)
  puts "\n TIC   TAC   TOE  "
  puts "\n.....|.....|....."
  puts   "..#{brd[1]}..|..#{brd[2]}..|..#{brd[3]}.."
  puts   ".....|.....|....."
  puts   "-----+-----+-----"
  puts   ".....|.....|....."
  puts   "..#{brd[4]}..|..#{brd[5]}..|..#{brd[6]}.."
  puts   ".....|.....|....."
  puts   "-----+-----+-----"
  puts   ".....|.....|....."
  puts   "..#{brd[7]}..|..#{brd[8]}..|..#{brd[9]}.."
  puts   ".....|.....|....."
  puts   "\nYou are #{HUMAN_MARKER}. Computer is #{COMPUTER_MARKER}."
end

def prepare_board(brd)
  (1..9).each { |key| brd[key] = NEUTRAL_MARKER }
end

def empty(brd)
  brd.select { |_, v| v == NEUTRAL_MARKER }.keys
end

def clear_screen
  system 'clear'
end

def joinor(arr, join)
  if arr.size == 1
    "There only remains #{arr[0]}, not much of a choice."
  else
    "#{arr[0..-2].join("#{join} ")} and #{arr[-1]}"
  end
end

def place_piece(brd, player)
  if player[0] == :human
    player[0] = :computer
    human_plays(brd)
  else
    player[0] = :human
    computer_plays(brd)
  end
end

def human_plays(brd)
  choice = nil

  loop do
    puts"\nChoose a position to place a piece: #{joinor(empty(brd), ',')}"
    choice = gets.chomp.to_i
    break if empty(brd).include?(choice)
    puts "\nSorry, incorrect choice."
  end

  brd[choice] = HUMAN_MARKER
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
# I know that this method is quite complex, but it's the most efficient way I
# found to detect the dangers/opportunities and reacting to them. Doing it in
# two different method would ask for more computation and lines.
def computer_plays(brd)
  choice = nil

  WINNING_LINES.each do |line|
    if (brd[line[0]] + brd[line[1]] + brd[line[2]]).chars.sort.join ==
       NEUTRAL_MARKER + COMPUTER_MARKER * 2
      # rubocop:disable Metrics/LineLength
      (0..2).each { |idx| choice = line[idx] if brd[line[idx]] == NEUTRAL_MARKER }
      break
    elsif (brd[line[0]] + brd[line[1]] + brd[line[2]]).chars.sort.join ==
          NEUTRAL_MARKER + HUMAN_MARKER * 2
      (0..2).each { |idx| choice = line[idx] if brd[line[idx]] == NEUTRAL_MARKER }
      break
    end
  end

  if choice.nil?
    # rubocop:disable Style/ConditionalAssignment
    brd[5] == NEUTRAL_MARKER ? choice = 5 : choice = empty(brd).sample
  end

  brd[choice] = COMPUTER_MARKER
  puts "\nComputer chooses #{choice}."
end

def tie?(brd)
  empty(brd).empty?
end

def winner?(brd, winner)
  WINNING_LINES.each do |line|
    if brd[line[0]] + brd[line[1]] + brd[line[2]] == HUMAN_MARKER * 3
      winner[0] = "human"
      return true
    elsif brd[line[0]] + brd[line[1]] + brd[line[2]] == COMPUTER_MARKER * 3
      winner[0] = "computer"
      return true
    end
  end
  false
end

def display_result(winner, human_computer_scores)
  case winner[0]
  when "human"
    human_computer_scores[:human] += 1
    puts "\nCongratulation, you won!"
  when "computer"
    human_computer_scores[:computer] += 1
    puts "\nSorry, you lost!"
  else
    puts "\nIt's a tie!"
  end
  puts "\nThe score is #{human_computer_scores[:human]} points for you, " \
       "#{human_computer_scores[:computer]} points for computer."
end

def five_wins?(scores)
  scores[:human] == 5 || scores[:computer] == 5
end

def display_final_winner(scores)
  if scores[:human] == 5
    puts "\nCongratulation, you're the TicTacToe grand Champion! Glory be " \
         "upon you and your offspring for 10 generations!"
  else
    puts "\nComputer won! Don't cry over it though. It probably cheated, " \
         "and TicTacToe is for children anyway."
  end
end

def play_again?
  choice = nil

  loop do
    puts "\nNo player has reach 5 points yet. Do you want keep playing to " \
         "become the grand champion? (y/n)"
    choice = gets.chomp.downcase
    break if %w(y n).include?(choice)
    puts "\nSorry, incorrect answer."
  end

  choice == "y"
end

def good_bye_message
  puts "\nGood Bye, thanks for playing Tic-Tac-Toe!"
end

human_computer_scores = { human: 0, computer: 0 }

welcome_message

loop do
  clear_screen
  board = {}
  current_player = [nil]
  winner = [nil]
  prepare_board(board)
  select_first_to_play(current_player)

  loop do
    board_display(board)
    place_piece(board, current_player)
    break if winner?(board, winner) || tie?(board)
  end

  board_display(board)
  display_result(winner, human_computer_scores)
  if five_wins?(human_computer_scores)
    display_final_winner(human_computer_scores)
    break
  else
    break unless play_again?
  end
end

good_bye_message
