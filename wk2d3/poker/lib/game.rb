require_relative 'deck'
require_relative 'player'
require_relative 'hand'
require_relative 'card'


class Game
  def initialize(num_players)
    @deck = Deck.new
    @num_players = num_players
  end

  def play

  end

  def play_turn

  end

  def tie(player1, player2)
    hand1 = values_arr(player1).sort.last
    hand2 = values_arr(player2).sort.last

    hand1 > hand2 ? player1 : player2
  end

  def values_arr(player)
    player.hand.dup.map{|card| card.value}
  end
end
