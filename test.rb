require_relative 'card_deck'
require_relative 'player'
require_relative 'card'

deck = CardDeck.new
player = Player.new(name: 'Andrew')
player.take_card(deck.take_rand_card)
player.take_card(deck.take_ace)
player.take_card(deck.take_rand_card)
player.cards.each { |card| puts card.inspect }
puts player.score
