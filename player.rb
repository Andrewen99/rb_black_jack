require_relative 'hand'
class Player
  attr_reader :name
  attr_accessor :money

  def initialize(name:)
    @name = name
    @hand = Hand.new
    @money = 100
  end

  def take_card(card)
    @hand.take_card(card) if @hand.can_take_card?
  end

  def can_take_card?
    @hand.can_take_card?
  end

  def flush_cards
    @hand.flush_cards
  end

  def score
    @hand.score
  end

  def cards
    @hand.cards
  end
end
