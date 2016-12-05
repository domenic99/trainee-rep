# Deck class creates deck of cards
class Deck
  attr_reader :cards, :h
  def initialize
    ranks = %w(2 3 4 5 6 7 8 9 10 11 12 13 14)
    suits = %w(Clubs Diamonds Hearts Spades)
    @cards = []
    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def flop
    @cards.shift(5)
  end

  def deal
    @cards.shift(2)
  end

  def shuffle
    @cards.shuffle!
  end
end

# Card class creates card
class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "Card: #{@rank} of #{@suit}"
  end
end
