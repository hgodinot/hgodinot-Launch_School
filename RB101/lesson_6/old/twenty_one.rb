SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
VALUE_LIMIT = 21
HEADS = ["Jack", "Queen", "King"]

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck(arr)
  SUITS.each do |suit|
    VALUES.each do |value|
      arr << [value, suit]
    end
  end
  arr
end

def player_gets_cards(player, number, cards)
  number.times do
    player << card = cards.sample
    cards.delete(card)
    prompt "You've been dealt the #{card[0]} of #{card[1]}."
  end
  puts ""
  prompt "Your hand is composed of the following cards:"
  puts ""
  player.size.times do |index|
    prompt "The #{player[index][0]} of #{player[index][1]}."
  end
  puts ""
  prompt "Your cards values are #{hand_value(player)}"
end

def dealer_gets_cards(player, number, cards)
  number.times do
    player << card = cards.sample
    cards.delete(card)
  end
end

def hand_value(hand)
  value = 0
  aces = 0
  hand.size.times do |index|
    case hand[index][0]
    when "Ace"
      value += 0
      aces += 1
    when *HEADS then value += 10
    else             value += hand[index][0]
    end
  end
  if aces > 0
    if value + 11 + aces - 1 <= VALUE_LIMIT
      value += 11 + aces - 1
    else
      value += aces
    end
  end
  value
end

def display(hand)
  card = hand.sample
  prompt("The dealer's revealed card is the #{card[0]} of #{card[1]}.")
end

def player_hits_or_stays(hand, cards)
  loop do
    break if hand_value(hand) > 21
    prompt "Do you want to hit or stay?"
    answer = gets.chomp.downcase
    if answer.start_with?("h")
      player_gets_cards(hand, 1, cards)
    elsif answer.start_with?("s")
      break
    else
      prompt("Incorrect answer, please type again.")
    end
  end
end

loop do
  deck = []
  player_hand = []
  dealer_hand = []

  initialize_deck(deck)
  player_gets_cards(player_hand, 2, deck)
  dealer_gets_cards(dealer_hand, 2, deck)
  puts ""
  display(dealer_hand)
  puts ""
  player_hits_or_stays(player_hand, deck)

  if hand_value(player_hand) > 21
    puts "Your hand value is more than 21, you lose"
  else
    prompt("Dealers' hand is:")
    prompt("The #{dealer_hand[0][0]} of #{dealer_hand[0][1]}.")
    prompt("The #{dealer_hand[1][0]} of #{dealer_hand[1][1]}.")
    puts ""
    until hand_value(dealer_hand) >= 17
      dealer_gets_cards(dealer_hand, 1, deck)
      prompt("The dealer's draws the #{dealer_hand[-1][0]} of #{dealer_hand[-1][1]}.")
      prompt("The dealer's hand value is #{hand_value(dealer_hand)}.")
      puts ""
    end
    if hand_value(dealer_hand) > 21
      prompt("The dealer's hand value is more than 21, he loses.")
    else
      case hand_value(player_hand) <=> hand_value(dealer_hand)
      when 1 then  prompt("congratulations, you win!")
      when -1 then prompt("You lost!")
      else         prompt("It's a draw")
      end
    end
  end

  prompt("Do you want to play again? ('yes' to continue)")
  break unless gets.chomp.downcase.start_with?("y")
end

puts ""
prompt("Thank you for playing!")
