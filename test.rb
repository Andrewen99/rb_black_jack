require_relative 'card_deck'
require_relative 'card'

deck = CardDeck.new
deck.cards.each { |card| puts card.inspect }
puts deck.cards.length
