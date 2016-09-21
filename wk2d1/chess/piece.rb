
class Piece
  attr_reader :piece, :symbol, :color
  attr_accessor :board, :symbol, :pos
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @symbol = nil
  end

  def valid_moves
    dup_grid = @board.dup(@board.rows)

    pos_moves = self.moves
    answer = pos_moves.select do |move|
      new_board= Board.new(dup_grid)
      new_board.move!(@pos, move)
      !(move_into_check?(new_board))
    end
  end

  def move_into_check?(board)
    board.check?(self.color)
  end
end
