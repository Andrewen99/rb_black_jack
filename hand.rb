class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def can_take_card?
    cards.length < 3
  end

  def score
    case aces_count
    when 0
      score_without_aces
    when 1
      if score_without_aces > 10
        score_without_aces + 1
      else
        score_without_aces + 11
      end
    when 2
      if score_without_aces > 9
        score_without_aces + 2
      else
        score_without_aces + 12
      end
    when 3
      13
    end
  end

  def flush_cards
    @cards = []
  end

  private

  def score_without_aces
    score = 0
    cards.each { |card| score += card.value unless card.name == 'A' }
    score
  end

  def card_values
    values = []
    cards.each { |card| values << card.value }
    values
  end

  def aces_count
    cards.count { |card| card.name == 'A' }
  end
end
