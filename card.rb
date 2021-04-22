class Card
  SHAPES = [:diamonds, :hearts, :spades, :clubs]
  VALUES = [*(2..10), "J", "Q", "K", "A"]
  
  attr_reader :value, :shape
  def initialize(value:, shape:)
    @value = value
    @shape = shape
  end
end
