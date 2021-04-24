require_relative 'card_deck'
require_relative 'player'
require_relative 'card'
require_relative 'game'

deck = CardDeck.new
player = Player.new(name: 'Andrew')
player.take_card(deck.take_rand_card)
player.take_card(deck.take_ace)
player.take_card(deck.take_ace)
player.cards.each { |card| puts card.inspect }
puts player.score

# player = Player.new(name: 'user')
# player2 = Player.new(name: 'diller')
# game = Game.new(player, player2)
# game.deck.cards.each { |card| puts card.inspect }
# game.start
# puts "game bank - #{game.bank}"
# puts "p1 money - #{player.money}, p2 money - #{player2.money}"
#
# h = { a: '100', b: '200' }
# h.each { |key, value| puts "#{key} is #{value}" }
