require_relative 'card'

class CardDeck
  attr_reader :cards
  def initialize
    create_deck
  end

  def create_deck
    @cards = []
    Card::SHAPES.each do |shape|
      Card::VALUES.each { |value| @cards << Card.new(value: value.to_s, shape: shape) }
    end
  end
end
