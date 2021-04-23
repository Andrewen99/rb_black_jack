class Game
  attr_reader :player1, :player2, :bank, :deck

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @bank = 0
    @deck = CardDeck.new
  end

  def start
    give_cards
    take_bid(10, @player1, @player2)
  end

  def give_cards
    2.times do
      player1.take_card(deck.take_rand_card)
      player2.take_card(deck.take_rand_card)
    end
  end

  def take_bid(amount, *players)
    players.each do |player|
      player.money -= amount
      @bank += amount
    end
  end
end
