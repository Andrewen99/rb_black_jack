class Card
  SHAPES = %i[diamonds hearts spades clubs]
  NAMES = [*(2..10), 'J', 'Q', 'K', 'A']

  attr_reader :name, :shape

  def initialize(name:, shape:)
    @name = name
    @shape = shape
  end

  def value
    return name if name.instance_of?(Integer)

    # пока не разобрался с реализацией логики туза
    # return [1, 11] if name == 'A'
    10
  end
end
