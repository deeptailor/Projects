require_relative 'piece'

class SlidingPiece < Piece
  VERTICAL = [[0,1],[0,-1]]
  DIAGONAL = [[1,1], [-1,-1], [1,-1], [-1,1]]
  HORIZONTAL = [[1,0], [-1,0]]
  def initialize (color, letter, pos, board)
    super
  end
  def moves(pos,)
    Rook.move_dirs

  end

end

class Bishop < SlidingPiece

end


class Rook < SlidingPiece

end

class Queen < SlidingPiece

end


b = SlidingPiece.new('red',5,6,7)
puts b.moves([1,1])
