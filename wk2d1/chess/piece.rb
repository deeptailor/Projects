class Piece
  attr_reader :piece
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





class Pawn < Piece
  def initialize (color, letter, pos, board)
    super
  end
  def moves
  end
end
