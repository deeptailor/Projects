require_relative 'piece'
require_relative 'null_piece'

class Board
attr_reader :rows
  def initialize(grid = Board.make_starting_grid)
    @rows = grid

  end

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  def []=(pos, piece)
    x,y = pos
    @rows[x][y] = piece
  end

  def dup()
  end

  def move(start, end_pos)
    if self[*start].is_a?(Piece)
      piece = self[*start]
        if self[*end_pos].is_a?(NullPiece)
          self[*end_pos] = piece
          self[*start] = NullPiece.instance
        else
          raise "Space occupied by piece" if self[*end_pos].is_a?(Piece)
          #raise "Illegal move by piece" if #piece can't move
        end
    end
  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  protected
  def self.make_starting_grid
    grid = Array.new(8) {Array.new(8,)}
    grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|
        if idx1.between?(0,1)
          grid[idx1][idx2] = Piece.new
        elsif idx1.between?(6,7)
          grid[idx1][idx2] = Piece.new
        else
          grid[idx1][idx2] = NullPiece.instance
        end
      end
    end
    grid
  end



end
a = Board.new([[]])
