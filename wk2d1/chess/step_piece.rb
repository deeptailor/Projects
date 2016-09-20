require_relative 'piece'
require_relative 'steppable'

class StepPiece < Piece
  include Steppable

  KNIGHT_MOVE = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
  KING_MOVE = [[0,1],[0,-1], [1,0], [-1,0], [1,1], [-1,-1], [1,-1], [-1,1]]

  def initialize (color, letter, pos, board)
    super
  end
  def moves(pos, dir)
    Steppable.moves(pos, dir)
  end
end

class King < StepPiece
  def move_dirs
    KING_MOVE
  end
end

class Knight < StepPiece
  def move_dirs
    KNIGHT_MOVE
  end
end

k = Knight.new('k', 5, [0,0], 5)
p k.moves(k.pos, k.move_dirs)
