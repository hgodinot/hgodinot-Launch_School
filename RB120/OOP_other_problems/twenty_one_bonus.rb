LIMIT = 21
MAX_VP = 5

class Participant
  attr_accessor :hand, :busted, :total, :victories, :winner, :grand_winner

  def initialize
    @hand = []
    @busted = false
    @total = 0
    @victories = 0
    @winner = false
    @grand_winner = false
  end

  def display_hand_value
    puts "\nCards values: #{hand_value}"
  end

  def hand_value
    value = { total: 0, ace: 0 }
    hand.each { |card| add_value_without_aces(card, value) }
    add_aces_to_value(value)
    self.total = value[:total]
  end

  def add_value_without_aces(card, value)
    if (2..10).cover? card.value.to_i
      value[:total] += card.value.to_i
    elsif %w(Jack Queen King).include? card.value
      value[:total] += 10
    else
      value[:ace] += 1
    end
  end

  def add_aces_to_value(value)
    value[:total] += value[:ace]
    value[:ace].times { value[:total] += 10 if value[:total] <= (LIMIT - 10) }
  end

  def busted?
    self.busted = true if hand_value > LIMIT
    busted
  end

  def show_hand
    puts ""
    puts hand
    display_hand_value
  end

  def draw_card(deck)
    hand << deck.deal_card
  end
end

class Player < Participant
  def show_hand
    puts "\nYour hand:"
    super
  end

  def draw_card(deck)
    super(deck)
    puts "\nYou draw #{hand[-1]}"
  end
end

class Dealer < Participant
  def show_initial_cards
    puts "\nThe dealer's hand:"
    puts "\n#{hand[0]}".chop + "\nand ?"
  end

  def show_hand
    puts "\nThe dealer's hand:"
    super
  end

  def stops_there
    hand_value >= LIMIT - 4
  end

  def draw_card(deck)
    super(deck)
    puts "\nDealer drew #{hand[-1]}"
  end

  def reveal_mystery_card
    puts "\nThe dealer's mystery card is revealed: \n#{hand[0]}.".chop
  end
end

class Deck
  SUITS = %w(Heart Diamond Club Spade)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  attr_accessor :cards

  def initialize
    prepare_deck
  end

  def prepare_deck
    @cards = []
    VALUES.product(SUITS).shuffle!.each do |value, suit|
      @cards << Card.new(value, suit)
    end
  end

  def deal_initial_cards(player, dealer)
    2.times { player.hand << deal_card }
    2.times { dealer.hand << deal_card }
  end

  def deal_card
    cards.pop
  end
end

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "The #{value} of #{suit}."
  end
end

class Game
  attr_reader :deck, :player, :dealer

  def start
    clear
    welcome_message
    play_game
    display_final_score
    good_bye_message
  end

  private

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def clear
    system 'clear'
  end

  def wait(seconds)
    sleep seconds
  end

  def wait_and_clear(seconds)
    sleep seconds
    clear
  end

  def play_game
    loop do
      player_and_dealer_play
      break if game_over?
      display_score
      break if player_quit?
      reset_game
    end
  end

  def player_and_dealer_play
    deck.deal_initial_cards(player, dealer)
    show_initial_cards
    player_turn
    dealer_turn unless player.busted
    who_won?
    display_winner
    update_score
  end

  def welcome_message
    puts "Welcome to Twenty-One! First at #{MAX_VP} points wins!"
  end

  def good_bye_message
    puts "\nThanks for playing Twenty-One!"
  end

  def show_initial_cards
    player.show_hand
    dealer.show_initial_cards
  end

  def player_turn
    loop do
      if player_at_limit?
        announce_limit
        break
      elsif player_stays?
        break
      end
      clear
      player.draw_card(deck)
      player.show_hand
      if player.busted?
        puts "\nYou're busted!"
        wait(2)
        break
      end
    end
  end

  def player_at_limit?
    player.total == LIMIT
  end

  def announce_limit
    puts "Your hand value is #{LIMIT}. No need to draw."
    wait(2)
  end

  def player_stays?
    stop_there?("Hit or stay? (h/s)", ["h", "s"], "s")
  end

  def player_quit?
    message = "Nobody has reached #{MAX_VP} points yet. Do you quit? (y/n)"
    stop_there?(message, ["y", "n"], "y")
  end

  def stop_there?(message, choices, answer)
    choice = nil
    loop do
      puts "\n#{message}"
      choice = gets.chomp.downcase
      break if choices.include? choice
      puts "\nSorry, incorrect answer. Please answer by '#{choices[0]}'" \
           " or '#{choices[1]}'."
    end
    choice == answer
  end

  def dealer_turn
    dealer_pre_turn
    dealer_drawing_phase(deck)
  end

  def dealer_pre_turn
    clear
    dealer.reveal_mystery_card
    dealer.show_hand
    wait_and_clear(2)
  end

  def dealer_drawing_phase(deck)
    loop do
      if dealer.stops_there
        puts "\nDealer stops there!"
        wait(2)
        break
      end
      dealer_draw_show(deck)
      if dealer.busted?
        puts "\nDealer is busted!"
        wait(2)
        break
      end
      wait_and_clear(3)
    end
  end

  def dealer_draw_show(deck)
    dealer.draw_card(deck)
    dealer.show_hand
  end

  def who_won?
    if dealer.busted
      player.winner = true
    elsif player.busted
      dealer.winner = true
    elsif player.total > dealer.total
      player.winner = true
    elsif dealer.total > player.total
      dealer.winner = true
    end
  end

  def display_winner
    clear
    if player.winner
      puts "\nYou win!"
    elsif dealer.winner
      puts "\nDealer wins!"
    else
      puts "\nIt's a tie!"
    end
    display_hands_value
    wait(3)
  end

  def display_hands_value
    puts "\nValue: #{player.total} for you, #{dealer.total} for dealer!" if
    !dealer.busted && !player.busted
  end

  def display_score
    puts "\nScore: #{player.victories} points for you, #{dealer.victories} " \
      "points for dealer!"
    wait(2)
  end

  def display_final_score
    clear
    if player.grand_winner
      puts "\nCongratulation, you're the grand winner."
    elsif dealer.grand_winner
      puts "\nSorry, dealer is the grand winner."
    else
      puts "\nGame stopped before someone had #{MAX_VP} wins."
    end
    puts "\nFinal score: #{player.victories} point(s) for you. " \
         "#{dealer.victories} point(s) for dealer."
  end

  def update_score
    if player.winner
      player.victories += 1
    elsif dealer.winner
      dealer.victories += 1
    end
  end

  def game_over?
    if player.victories == MAX_VP
      player.grand_winner = true
      return true
    elsif dealer.victories == MAX_VP
      dealer.grand_winner = true
      return true
    end
    false
  end

  def reset_game
    clear
    clean_hands
    clean_total
    clean_status
  end

  def clean_hands
    player.hand = []
    dealer.hand = []
  end

  def clean_total
    player.total = 0
    dealer.total = 0
  end

  def clean_status
    player.busted = false
    dealer.busted = false
    player.winner = false
    dealer.winner = false
  end
end

Game.new.start
