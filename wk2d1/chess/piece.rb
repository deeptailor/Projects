
class Piece
  attr_reader :piece, :pos, :symbol, :color
  attr_accessor :board, :symbol
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @symbol = nil
  end

  def valid_moves
    @board.move!(start, stop)
  end
  def move_into_check?(pos)
    dup_grid = @board.dup(@board.rows)
    new_board= Board.new(dup_grid)
    new_board.move(pos)
  end
end
