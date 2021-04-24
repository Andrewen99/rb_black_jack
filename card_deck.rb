require_relative 'card'

class CardDeck
  attr_reader :cards

  def initialize
    create_deck
  end

  def take_rand_card
    cards.delete(cards.sample)
  end

  private

  def create_deck
    @cards = []
    Card::SHAPES.each do |key, _value|
      Card::NAMES.each { |name| @cards << Card.new(name: name, shape: key) }
    end
  end
end
