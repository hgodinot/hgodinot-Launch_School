# rubocop:disable Metrics/LineLength
SUITS = %w(heart diamond club spade)
VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
LIMIT = 21

def clear
  system 'clear'
end

def wait
  sleep 2
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def deal_card(hand, deck)
  hand << deck.pop
end

def deal_reveal_initial_cards(deck, player)
  hand = []
  2.times do
    deal_card(hand, deck)
  end

  if player == :player
    display_hand(hand, :player)
  else
    puts "\nThe dealer has the #{display_card(hand[rand(2)]).chop} and one hidden card."
  end
  hand
end

def display_card(card)
  "#{card[0]} of #{card[1]}.".capitalize
end

def display_hand(hand, player)
  puts player == :player ? "\nYour hand is:" : "\nThe dealer hand is:"
  puts ""
  hand.each { |card| puts "#{card[0]} of #{card[1]}.".capitalize }
  puts "\nHand value: #{hand_value(hand)}"
end

def hand_value(cards)
  value = 0
  ace = 0

  cards.each do |card|
    if (2..10).cover? card[0].to_i
      value += card[0].to_i
    elsif %w(jack queen king).include? card[0]
      value += 10
    else
      ace += 1
    end
  end

  value += ace
  ace.times { value += 10 if value <= (LIMIT - 10) }
  value
end

def player_stop?
  answer = nil
  loop do
    puts "\nDo you want to draw a new card? (y/n)"
    answer = gets.chomp.downcase
    break if %w(y n).include? answer
    puts "Sorry, incorrect answer."
  end

  answer == "n"
end

def busted?(hand)
  hand_value(hand) > LIMIT
end

def player_turn(hand, deck)
  deal_card(hand, deck)
  puts "\nYou were dealt the #{display_card(hand[-1])}"
  display_hand(hand, :player)
end

def dealer_turn(hand, deck)
  loop do
    break if hand_value(hand) >= (LIMIT - 4)
    deal_card(hand, deck)
    puts "\nDealer was dealt the #{display_card(hand[-1])}"
    wait
  end

  puts busted?(hand) ? "\nThe dealer is busted!" : "\nThe dealer stops there!"
  wait
  display_hand(hand, :dealer)
end

def compare_hands(count, player_hand, dealer_hand)
  if busted?(player_hand)
    count[:dealer] += 1
    :player_busted
  elsif busted?(dealer_hand)
    count[:player] += 1
    :dealer_busted
  elsif hand_value(player_hand) > hand_value(dealer_hand)
    count[:player] += 1
    :player
  elsif hand_value(dealer_hand) > hand_value(player_hand)
    count[:dealer] += 1
    :dealer
  else
    :draw
  end
end

def declare_winner(count, first_hand, second_hand)
  case compare_hands(count, first_hand, second_hand)
  when :player_busted
    puts "\nYou busted, you lose!"
  when :dealer_busted
    puts "\nDealer busted, you win!"
  when :player
    puts "\nYou win with a score of #{hand_value(first_hand)} against #{hand_value(second_hand)}."
  when :dealer
    puts "\nDealer wins with a score of #{hand_value(second_hand)} against #{hand_value(first_hand)}."
  else
    puts "\nIt's a tie. You both have a score of #{hand_value(first_hand)}."
  end
end

def welcome_message
  puts "\nWelcome to our BlackJack table. First player at 5 points win. Good luck!"
end

def good_bye_message
  puts "\nThanks for playing. Come back soon!"
end

def play_again?
  answer = nil

  loop do
    puts "\nNo player has reached 5 points yet. Do you want to keep playing? (y/n)"
    answer = gets.chomp.downcase
    break if %w(y n).include? answer
    puts "Sorry, incorrect answer."
  end

  answer == 'y'
end

def five_points?(count)
  if count[:player] == 5
    puts "\nCongratulation, you won!"
    return true
  elsif count[:dealer] == 5
    puts "\nSorry, you lost!"
    return true
  end
  false
end

def display_points(count)
  puts "\nYou've got #{count[:player]} point(s). Dealer has #{count[:dealer]} point(s)."
end

clear
welcome_message
points_count = { player: 0, dealer: 0 }
wait

loop do
  deck = initialize_deck
  player_hand = deal_reveal_initial_cards(deck, :player)
  wait
  dealer_hand = deal_reveal_initial_cards(deck, :dealer)

  loop do
    break if player_stop?
    clear
    player_turn(player_hand, deck)
    if busted?(player_hand)
      puts "\nYou're busted!"
      break
    end
  end
  wait
  clear

  display_hand(dealer_hand, :dealer) if hand_value(dealer_hand) < (LIMIT - 4) || busted?(player_hand)
  dealer_turn(dealer_hand, deck) if hand_value(player_hand) <= LIMIT
  wait
  declare_winner(points_count, player_hand, dealer_hand)
  display_points(points_count)
  break if five_points?(points_count)
  break unless play_again?
  clear
end

good_bye_message
