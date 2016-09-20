require_relative 'piece'

class StepPiece < Piece
  def initialize (color, letter, pos, board)
    super
  end
  def moves
  end
end

class King < StepPiece
  attr_reader :letter
  def move_diffs
  end
end

class Knight < StepPiece
  attr_reader :letter
  def move_diffs
  end
end
