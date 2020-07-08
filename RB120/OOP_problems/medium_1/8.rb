class Card
  include Comparable
  attr_reader :rank, :suit
  
  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def value
    VALUES.fetch(rank, rank)
  end
    
  def <=>(other_card)
    value <=> other_card.value
  end
  
  def to_s
    "The #{rank} of #{suit}"
  end
end
