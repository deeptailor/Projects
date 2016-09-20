require_relative 'piece'
require_relative 'slidable'

class SlidingPiece < Piece
  include Slidable
  LATERAL = [[0,1],[0,-1], [1,0], [-1,0]]
  DIAGONAL = [[1,1], [-1,-1], [1,-1], [-1,1]]

  def initialize (color, letter, pos, board)
    super
  end
  def moves(pos, dir)
    Slidable.moves(pos, dir)
  end
end

class Bishop < SlidingPiece
  def move_dirs
    DIAGONAL
  end

end


class Rook < SlidingPiece
  def move_dirs
    LATERAL
  end
end

class Queen < SlidingPiece
  def move_dirs
    DIAGONAL.dup.concat(LATERAL)
  end
end
