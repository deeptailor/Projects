
class Piece
  attr_reader :piece, :pos, :symbol, :color
  attr_accessor :board, :symbol
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @symbol = nil
  end

  def moves
    #return array of moves piece can move to
  end


end
