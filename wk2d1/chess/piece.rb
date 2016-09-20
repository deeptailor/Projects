class Piece
  attr_reader :piece, :pos
  def initialize(color, letter, pos, board)
    @color = color.to_sym
    @letter = letter
    @pos = pos
    @board = board
  end

  def moves
    #return array of moves piece can move to
  end


end
