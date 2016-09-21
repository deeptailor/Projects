class TowersOfHanoi
  attr_reader :pegs
  def initialize
    @pegs = Array.new(3){ Array.new(3) {9} }
    @pegs[0] = [1,2,3]
  end

  def move(start, end_pos)
    if is_valid?(start, end_pos)
      disc = @pegs[start].shift
      @pegs[start] << 9
      @pegs[end_pos].pop
      @pegs[end_pos].unshift(disc)
    else
      raise 'Invalid Move'
    end
  end

  def is_valid?(start, end_pos)
    return false if !start.between?(0,2) || !end_pos.between?(0,2)
    unless @pegs[start].empty?
      return true if @pegs[end_pos].empty?

      if @pegs[start].first > @pegs[end_pos].first
        return false
      else
        return true
      end

    end
    false
  end

  def won?
    @pegs[1].length == 3 || @pegs[2].length == 3
  end

  def render
    system('clear')
    copy = @pegs.dup.transpose
    p copy
    copy.each do |peg|
      print "#{@peg[0]} || "
    end


  end
end


class Game
  def initialize(name = 'player1')
    @player = name
    @board = Board.new
  end

end
