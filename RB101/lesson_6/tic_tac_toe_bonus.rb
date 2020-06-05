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

def select_first_to_play
  choice = nil

  loop do
    puts "\nWho will be the first player? 1 for you, 2 for computer, " \
         "3 for random choice."
    choice = gets.chomp
    break if %w(1 2 3).include?(choice)
    puts "\nSorry, incorrect choice."
  end

  case choice
  when "1" then return PLAYERS[0]
  when "2" then return PLAYERS[1]
  else          return PLAYERS.sample
  end
end

# rubocop:disable Metrics/AbcSize
def board_display(brd)
  puts "\n TIC   TAC   TOE  "
  puts "\n     |     |"
  puts   "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts   "     |     |"
  puts   "-----+-----+-----"
  puts   "     |     |"
  puts   "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts   "     |     |"
  puts   "-----+-----+-----"
  puts   "     |     |"
  puts   "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts   "     |     |"
  puts   "\nYou are #{HUMAN_MARKER}. Computer is #{COMPUTER_MARKER}."
end

def prepare_board
  brd = {}
  (1..9).each { |key| brd[key] = NEUTRAL_MARKER }
  brd
end

def empty_boxes(brd)
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
  # rubocop:disable Style/ConditionalAssignment
  player == :human ? human_plays(brd) : computer_plays(brd)
end

def alternate_player(player)
  player == :human ? :computer : :human
end

def human_plays(brd)
  choice = nil

  loop do
    puts"\nChoose a position to place a piece: #{joinor(empty_boxes(brd), ',')}"
    choice = gets.chomp.to_i
    break if empty_boxes(brd).include?(choice)
    puts "\nSorry, incorrect choice."
  end

  brd[choice] = HUMAN_MARKER
end

def computer_plays(brd)
  choice = [nil]

  if attack_opportunity?(brd, choice)
  elsif threat?(brd, choice)
  else
    # rubocop:disable Metrics/LineLength
    brd[5] == NEUTRAL_MARKER ? choice[0] = 5 : choice[0] = empty_boxes(brd).sample
  end

  brd[choice[0]] = COMPUTER_MARKER
  puts "\nComputer chooses #{choice[0]}."
end

def attack_opportunity?(brd, choice)
  WINNING_LINES.each do |line|
    if (brd[line[0]] + brd[line[1]] + brd[line[2]]).chars.sort.join ==
       NEUTRAL_MARKER + COMPUTER_MARKER * 2
      (0..2).each { |idx| choice[0] = line[idx] if brd[line[idx]] == NEUTRAL_MARKER }
      return true
    end
  end
  false
end

def threat?(brd, choice)
  WINNING_LINES.each do |line|
    if (brd[line[0]] + brd[line[1]] + brd[line[2]]).chars.sort.join ==
       NEUTRAL_MARKER + HUMAN_MARKER * 2
      (0..2).each { |idx| choice[0] = line[idx] if brd[line[idx]] == NEUTRAL_MARKER }
      return true
    end
  end
  false
end

def tie?(brd)
  empty_boxes(brd).empty?
end

def winner?(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] + brd[line[1]] + brd[line[2]] == HUMAN_MARKER * 3
      return :human
    elsif brd[line[0]] + brd[line[1]] + brd[line[2]] == COMPUTER_MARKER * 3
      return :computer
    end
  end
  nil
end

def display_result(winner, human_computer_scores)
  case winner
  when :human
    human_computer_scores[:human] += 1
    puts "\nCongratulation, you won!"
  when :computer
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

# rubocop:disable Metrics/MethodLength
def play
  human_computer_scores = { human: 0, computer: 0 }
  clear_screen
  welcome_message
  
  loop do
    winner = nil
    board = prepare_board
    clear_screen
    current_player = select_first_to_play

    loop do
      clear_screen
      board_display(board)
      place_piece(board, current_player)
      winner = winner?(board)
      break if winner || tie?(board)
      current_player = alternate_player(current_player)
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
end

play
