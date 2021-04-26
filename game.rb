class Game
  attr_reader :player, :dealer, :bank, :deck

  def initialize(player, dealer)
    @player = player
    @dealer = dealer
    @bank = 0
  end

  def start_round
    @deck = CardDeck.new
    @player.flush_cards
    @dealer.flush_cards
    give_cards
    take_bid(10, @player, @dealer)
  end

  def give_cards
    2.times do
      give_card(player)
      give_card(dealer)
    end
  end

  def give_card(player)
    player.take_card(deck.take_rand_card)
  end

  def take_bid(amount, *players)
    players.each do |player|
      player.money -= amount
      @bank += amount
    end
  end

  def return_bid(amount, *players)
    players.each do |player|
      @bank -= amount
      player.money += amount
    end
  end

  def dealer_logic
    give_card(@dealer) if @dealer.score < 17
  end

  def winner
    if draw?
      nil
    elsif @player.score > 21
      @dealer
    elsif @dealer.score > 21
      @player
    else
      higher_score_player
    end
  end

  def return_money_to_winner
    if draw?
      return_bid(10, @player, @dealer)
    else
      return_bid(20, winner)
    end
  end

  def finish_condition?
    !@player.can_take_card? && !@dealer.can_take_card?
  end

  private

  # ничья
  def draw?
    @player.score > 21 && @dealer.score > 21 || @player.score == @dealer.score
  end

  def higher_score_player
    if @player.score > @dealer.score
      @player
    else
      @dealer
    end
  end
end
