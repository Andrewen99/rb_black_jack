class Player
  attr_reader :name, :cards
  attr_accessor :money

  def initialize(name:)
    @name = name
    @cards = []
    @money = 100
  end

  def take_card(card)
    cards << card
  end

  def score
    sort_cards
    score = 0
    card_values.each { |val| score += val }
    score
  end

  def card_values
    values = []
    cards.each { |card| values << card.value }
    values
  end

  private

  # перемещает туз в конец списка карт для подсчета очков
  def sort_cards
    cards.sort_by! { |card| card.name == 'A' ? 1 : 0 }
  end
end
