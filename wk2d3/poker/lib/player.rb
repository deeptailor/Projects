require_relative 'card'

class Player
  attr_accessor :hand, :personal_pot

  def initialize(hand, personal_pot = 100)
    @hand = hand
    @personal_pot = personal_pot
  end

  def delete_cards(array)
    array = array.sort.reverse
    array.each{|i| @hand.delete_at(i)}
  end

  def add_cards(array)
    array.each{|card| @hand << card}
  end

  def bet(amount)
    raise ArgumentError if @personal_pot - amount < 0
    @personal_pot -= amount
  end

end
