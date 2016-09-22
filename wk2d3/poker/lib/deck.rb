require_relative "card"

class Deck
  attr_reader :deck

  VALUE = [
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
  ]

  SUITS = [:hearts, :spades, :diamonds, :clubs]

  def initialize
    @deck = []
    populate_deck
    @deck = @deck.shuffle
  end

  def populate_deck
    SUITS.each do |suit|
      VALUE.each do |value|
        @deck << Card.new(value, suit)
      end
    end
  end

end
