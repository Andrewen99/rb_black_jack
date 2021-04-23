require_relative 'card'

class CardDeck
  attr_reader :cards

  def initialize
    create_deck
  end

  def create_deck
    @cards = []
    Card::SHAPES.each do |shape|
      Card::NAMES.each { |name| @cards << Card.new(name: name, shape: shape) }
    end
  end

  def take_rand_card
    cards.delete(cards.sample)
  end

  def take_ace
    cards.delete(cards.select { |card| card.name == 'A' }.first)
  end
end
