class Poker
  def initialize(hands)
    hands = [hands] if hands == hands.flatten # Array of non array elements
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    @hands.each(&:evaluate_hand)
    compare_hands
    @hands.map(&:original_hand)
  end

  private

  def compare_hands
    6.times do |idx|
      rank_max = @hands.map { |hand| hand.all_ranks[idx] }.max
      @hands.select! { |hand| hand.all_ranks[idx] == rank_max }
      break if @hands.size == 1
    end
  end
end

class Hand
  attr_reader :original_hand, :hand_rank, :all_ranks

  def initialize(hand)
    check_error(hand)
    @original_hand = hand
    @hand = hand.map { |card| Card.new(card) }
  end

  def check_error(hand)
    raise ArgumentError.new, 'Need 5 cards by hand' if hand.size != 5
    # raise ArgumentError.new, 'No duplicates' if hand.uniq.size != 5
    # Disabled because of cards duplicates in tests
  end

  def evaluate_hand
    hand_sort!
    @cards_ranks = @hand.map(&:rank)
    evaluate_rank
    @all_ranks = [@hand_rank, @card_r1, @card_r2, @card_r3, @card_r4, @card_r5]
  end

  private

  def hand_sort!
    @hand.sort! { |card_a, card_b| card_a.rank <=> card_b.rank }
  end

  def evaluate_rank # Testing each combination, stoping when one is true
    if straight_flush?
      straight_flush
    elsif four_of_kind?
      four_of_kind
    elsif full_house?
      full_house
    elsif flush?
      flush
    elsif straight?
      straight
    elsif low_straight?
      low_straight
    elsif three_kind?
      three_kind
    elsif two_pairs?
      two_pairs
    elsif one_pair?
      one_pair
    else
      high_card
    end
  end

  def straight_flush?
    flush? && straight? || low_straight?
  end

  def straight_flush
    low_straight? ? low_straight : straight
    @hand_rank = 9
  end

  def four_of_kind?
    @cards_ranks.uniq.size == 2 && @cards_ranks[1] == @cards_ranks[3]
  end

  def four_of_kind
    @hand_rank = 8
    if @cards_ranks[0] == @cards_ranks[3]
      @card_r1 = @cards_ranks[0]
      @card_r2 = @cards_ranks[4]
    else
      @card_r1 = @cards_ranks[4]
      @card_r2 = @cards_ranks[0]
    end
  end

  def full_house?
    @cards_ranks.uniq.size == 2
  end

  def full_house
    @hand_rank = 7
    @card_r1 = @cards_ranks[2]
    @card_r2 = if @cards_ranks[0] == @cards_ranks[2]
                 @cards_ranks[4]
               else
                 @cards_ranks[0]
               end
  end

  def flush?
    @hand.map(&:suit).uniq.size == 1
  end

  def flush
    @hand_rank = 6
    @card_r1, @card_r2, @card_r3, @card_r4, @card_r5 = @cards_ranks.reverse
  end

  def straight?
    @cards_ranks.uniq.size == 5 && @cards_ranks[4] - @cards_ranks[0] == 4
  end

  def straight
    @hand_rank = 5
    @card_r1, @card_r2, @card_r3, @card_r4, @card_r5 = @cards_ranks.reverse
  end

  def low_straight?
    @cards_ranks == [2, 3, 4, 5, 14]
  end

  def low_straight
    @hand_rank = 5
    @card_r1 = 14
    @card_r2, @card_r3, @card_r4, @card_r5 = @cards_ranks[0, 4].reverse
  end

  def three_kind?
    @cards_ranks[0] == @cards_ranks[2] || @cards_ranks[1] == @cards_ranks[3] ||
      @cards_ranks[2] == @cards_ranks[4]
  end

  def three_kind
    @hand_rank = 4
    @card_r1 = @cards_ranks[2]
    if @cards_ranks[0] == @cards_ranks[2]
      @card_r3 = @cards_ranks[3]
      @card_r2 = @cards_ranks[4]
    elsif @cards_ranks[1] == @cards_ranks[3]
      @card_r3 = @cards_ranks[0]
      @card_r2 = @cards_ranks[4]
    else
      @card_r3 = @cards_ranks[0]
      @card_r2 = @cards_ranks[1]
    end
  end

  def two_pairs?
    @cards_ranks.uniq.size == 3
  end

  def two_pairs
    @hand_rank = 3
    @card_r1 = @cards_ranks.select { |x| @cards_ranks.count(x) == 2 }.last
    @card_r2 = @cards_ranks.select { |x| @cards_ranks.count(x) == 2 }.first
    @card_r3 = @cards_ranks.select { |x| @cards_ranks.count(x) == 1 }.first
  end

  def one_pair?
    @cards_ranks.uniq.size == 4
  end

  def one_pair
    @hand_rank = 2
    @card_r1 = @cards_ranks.select { |x| @cards_ranks.count(x) == 2 }.first
    @card_r2, @card_r3, @card_r4 = @cards_ranks.select do |x|
      @cards_ranks.count(x) == 1
    end.reverse
  end

  def high_card
    @hand_rank = 1
    @card_r1, @card_r2, @card_r3, @card_r4, @card_r5 = @cards_ranks.reverse
  end
end

class Card
  attr_reader :rank, :suit

  CONVERSION = { "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14 }

  def initialize(card)
    raise ArgumentError, 'Invalid card' if !card.match(/([2-9TJQKA][SHCD])/)
    @value = card[0]
    @rank = CONVERSION[@value] || @value.to_i
    @suit = card[1]
  end
end
