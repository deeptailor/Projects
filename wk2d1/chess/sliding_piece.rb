require_relative 'piece'
require_relative 'slidable'
require 'colorize'

class SlidingPiece < Piece
  include Slidable
  LATERAL = [[0,1],[0,-1], [1,0], [-1,0]]
  DIAGONAL = [[1,1], [-1,-1], [1,-1], [-1,1]]

  def initialize (color, pos, board)
    super
  end

  def moves(pos, dir)
    Slidable.moves(pos, dir).select do |e|
      !(@board[*e].is_a?(Piece) && @board[*e].color == self.color)
    end
  end

end

class Bishop < SlidingPiece
  def initialize(color, pos, board)
    super
    if self.color == 'white'
      @symbol = "\u2657".encode("utf-8")
    else
      @symbol =  "\u265D".encode("utf-8")
    end
  end
  def move_dirs
    DIAGONAL
  end

end


class Rook < SlidingPiece
  def initialize(color, pos, board)
    super
    @symbol = self.color == 'white' ? "\u2656".encode("utf-8") : "\u265c".encode("utf-8")
  end

  def move_dirs
    LATERAL
  end
end

class Queen < SlidingPiece
  def initialize(color, pos, board)
    super
    @symbol = (self.color == 'white' ? "\u2655".encode("utf-8") : "\u265b".encode("utf-8"))
  end

  def move_dirs
    DIAGONAL.dup.concat(LATERAL)
  end
end

# q = Queen.new('white', 'q', [0,0], 11)
# puts q.symbol
