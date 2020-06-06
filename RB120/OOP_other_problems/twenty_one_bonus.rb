require "pry"
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
    puts "\nCards values: #{self.hand_value}"
  end

  def hand_value
    value = 0
    ace = 0

    self.hand.each do |card|
      if (2..10).cover? card.value.to_i
        value += card.value.to_i
      elsif %w(Jack Queen King).include? card.value
        value += 10
      else
        ace += 1
      end
    end

    value += ace
    ace.times { value += 10 if value <= (LIMIT - 10) }
    self.total = value
    value
  end

  def busted?
    if self.hand_value > LIMIT
      self.busted = true
      true
    end
  end

  def show_hand
    puts ""
    hand.each { |card| puts "#{card}"}
    display_hand_value
  end
  
  def draw_card(deck)
    hand << deck.deal_card
  end
end

class Player < Participant
  def show_initial_cards
    puts "\nYour hand:"
    puts ""
    hand.each { |card| puts "#{card}"}
    display_hand_value
  end
  
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
      if hand_value >= LIMIT - 4
        puts "\nDealer stops there!"
        return true
      end
      false
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
    VALUES.product(SUITS).shuffle!.each { |value, suit| @cards << Card.new(value, suit)}
  end

  def deal_initial_cards(player, dealer)
    2.times {player.hand << deal_card}
    2.times {dealer.hand << deal_card}
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
      loop do
        deck.deal_initial_cards(player, dealer)
        show_initial_cards
        player_turn
        dealer_turn unless player.busted
        update_score
        display_winner
        break if game_over?
        break if player_quit?
        display_score
        reset_game
      end
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

  def welcome_message
    puts "Welcome to Twenty-One! First at #{MAX_VP} points wins!"
  end

  def good_bye_message
    puts "\nThanks for playing Twenty-One!"
  end

  def show_initial_cards
    player.show_initial_cards
    dealer.show_initial_cards
  end
  
  def player_turn
    loop do
      break if stops_there?("Draw again ? (y/n)")
        player.draw_card(deck)
        player.show_hand
      if player.busted?
        puts "\nYou're busted!"
        break
      end
    end
  end

  def dealer_turn
    loop do
      dealer.reveal_mystery_card
      dealer.show_hand
      break if dealer.stops_there
      dealer.draw_card(deck)
      dealer.show_hand
      if dealer.busted?
        puts "\nDealer is busted!"
        break
      end
    end
  end

  def display_winner
    if dealer.busted? || player_won?
      puts "\nYou win!"
    elsif player.busted? || dealer_won?
      puts "\nDealer wins!"
    else
      puts "\nIt's a tie!"
    end
    if !dealer.busted? && !player.busted?
      puts "\nValue: #{player.total} for you, #{dealer.total} for dealer!"
    end
  end

  def display_score
    puts "Score: #{player.victories} points for you, #{dealer.total} " +
           "points for dealer!"
  end

  def display_final_score
    if player.grand_winner
      puts "Congratulation, you're the grand winner. Final score: #{MAX_VP} " +
           "points for you, #{dealer.victories} poits for dealer."
    else
      puts "Sorry, dealer is the grand winner. Final score: #{MAX_VP} " +
           "points for dealer, #{player.victories} poits for you."
    end
  end

  def player_won?
    if dealer.busted || player.total > dealer.total
      player.winner = true
      return true
    end
    false
  end

  def dealer_won?
    if player.busted || dealer.total > player.total
      dealer.winner = true
      return true
    end
    false
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
  
  def stops_there?(message)
    answer = nil
    loop do
      puts "\n#{message}"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "\nSorry, incorrect answer. Please answer by 'y' or 'n'."
    end
  answer == "n"
  end
  
  def player_quit?
    message = "\nNobody has reached #{MAX_VP} points yet. Do you quit? (y/n)"
    stop_there?(message)
  end
  
  def reset_game
    player.hand = []
    dealer.hand = []
    player.total = dealer.total = 0
    player.busted = dealer.busted = false
  end
end

Game.new.start

#Encore problèmes sur Busted et victoires. Considère que je gagne alors que Busted (mais score de 23...)