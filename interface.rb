require_relative 'game'
require_relative 'card'
require_relative 'player'
require_relative 'card_deck'

class Interface
  DEALER_NAME = 'дилер'
  attr_reader :game

  def start_game
    puts 'Введите имя:'
    @game = Game.new(Player.new(name: gets.chomp), Player.new(name: DEALER_NAME))
    game_loop
  end

  private

  def print_money_info
    puts '-----------Деньги------------'
    puts "Банк: #{@game.bank}$"
    puts "#{@game.player.name}: #{@game.player.money}$"
    puts "#{@game.dealer.name}: #{@game.dealer.money}$"
    print '---------------------------------'
  end

  def print_game_info
    print_player_info(@game.player)
    print_cards(@game.dealer, true)
  end

  def print_player_info(player)
    print_cards(player)
    print_score(player)
  end

  def print_cards(player, hide_cards = false)
    print "\nКарты игрока #{player.name}: "
    player.cards.each do |card|
      if hide_cards
        print '** '
      else
        symbol = Card::SHAPES[card.shape]
        print "#{card.name}#{symbol} "
      end
    end
  end

  def print_score(player)
    print "\nКоличество очков игрока #{player.name}: #{player.score}"
  end

  def game_loop
    @game.start_round
    print_money_info
    until @game.finish_condition?
      print_game_info
      case player_move
      when '1'
        dealer_move
      when '2'
        break
      when '3'
        @game.give_card(@game.player)
        dealer_move
      end
    end
    finish_round
    print_money_info
    new_round
  end

  def player_move
    puts "\nНажмите
    1 чтобы пропустить ход
    2 чтобы открыть карты"
    puts '    3 чтобы добавить карту' if @game.player.can_take_card?
    gets.chomp
  end

  def new_round
    puts "\nНажмите 1, если хотите начать следующий раунд"
    game_loop if gets.chomp == '1'
  end

  def finish_round
    print_player_info(@game.player)
    print_player_info(@game.dealer)
    if @game.winner.nil?
      puts "\nНичья"
    else
      puts "\nПобедитель: #{@game.winner.name}"
    end
    @game.return_money_to_winner
  end

  def dealer_move
    puts 'Ход диллера...'
    @game.dealer_logic
  end
end
