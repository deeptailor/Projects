class Hand
  def initialize(array)
    @hand = array.dup.sort{|a,b| a.value <=> b.value}
  end

  def type_of_hand
    if royal_flush?
      9
    elsif straight_flush?
      8
    elsif four_of_a_kind?
      7
    elsif full_house?
      6
    elsif flush?
      5
    elsif straight?
      4
    elsif three_of_a_kind?
      3
    elsif two_pair?
      2
    elsif pair?
      1
    else
      0
    end
  end

  private

  def royal_flush?
    flush? && @hand.all?{|card| card.value.between?(10,14)}
  end

  def straight_flush?
     flush? && straight?
  end

  def four_of_a_kind?
    hash = hash_values
    hash.has_value?(4)
  end

  def full_house?
    hash = hash_values
    hash.has_value?(3) && hash.has_value?(2)
  end

  def flush?
    @hand.dup.map{|card| card.suit}.uniq.length == 1
  end

  def straight?
    values = values_arr
    values.each_with_index do |_, i|
      unless i >= values.length-2
        difference = values[i] - values[i+1]
        return false if difference != -1
      end
    end
    true
  end

  def three_of_a_kind?
    hash = hash_values
    hash.has_value?(3)
  end

  def two_pair?
    hash = hash_values
    hash.keys.length == 3
  end

  def pair?
    hash = hash_values
    hash.has_value?(2)
  end



  def values_arr
    @hand.dup.map{|card| card.value}
  end

  def hash_values
    hash = Hash.new(0)

    values = values_arr
    values.each do |val|
      hash[val] += 1
    end
    hash
  end
end
