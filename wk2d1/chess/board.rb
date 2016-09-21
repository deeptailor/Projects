require_relative 'null_piece'
require_relative 'sliding_piece'
require_relative 'step_piece'
require_relative 'pawn'

class Board
attr_reader :rows
  def initialize(grid = Board.make_starting_grid)
    @rows = grid

    @rows.each_with_index do |row, idx1|
      row.each_with_index do |_, idx2|
        next if @rows[idx1][idx2].is_a?(NullPiece)
        @rows[idx1][idx2].board = @rows
      end
    end
  end

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  def []=(pos, piece)
    x,y = pos
    @rows[x][y] = piece
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

  def move!(start, stop)

  end

  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def locate_piece(color, type)

    @rows.each_with_index do |row, idx1|
      row.each do |piece|
        if piece.is_a?(type) && (piece.color == color)
          return piece
        end
      end
    end

  end

  def in_check?(color)
    king_pos = locate_piece(color, King).pos

    @rows.each_with_index do |row, idx1|
      row.each do |piece|
        return true if piece.moves.include?(king_pos)
      end
    end
    false
  end

  def checkmate?(color)
    if in_check?(color)
      @rows.each_with_index do |row, idx1|
        row.each do |piece|
          return false if piece.valid_moves?
        end
      end
      return true
    end

    return false
  end



  def dup(cboard)
    copy = []
    # debugger
    cboard.each do |rows|
      copy1 = []
      # debugger
      rows.length.times do |i|
        if rows[i].is_a?(Piece)
          copy1 << rows[i].dup
        else
          copy1 << rows[i]
        end
      end
      copy << copy1
    end
    copy.each{|row| row.each {|piece| piece.board = copy if piece.is_a?(Piece)}}
    copy
  end
# def initialize(color, pos, board)
  protected
  def self.make_starting_grid
    grid = Array.new(8) {Array.new(8,)}
    grid.each_with_index do |row, idx1|
      row.each_with_index do |square, idx2|

        if idx1 == 0
          case idx2
          when 0
            grid[idx1][idx2] = Rook.new("black", grid[idx1][idx2], nil)
          when 1
            grid[idx1][idx2] = Knight.new("black", grid[idx1][idx2], nil)
          when 2
            grid[idx1][idx2] = Bishop.new("black", grid[idx1][idx2], nil)
          when 3
            grid[idx1][idx2] = Queen.new("black", grid[idx1][idx2], nil)
          when 4
            grid[idx1][idx2] = King.new("black", grid[idx1][idx2], nil)
          when 5
            grid[idx1][idx2] = Bishop.new("black", grid[idx1][idx2], nil)
          when 6
            grid[idx1][idx2] = Knight.new("black", grid[idx1][idx2], nil)
          when 7
            grid[idx1][idx2] = Rook.new("black", grid[idx1][idx2], nil)
          end
        elsif idx1 == 1
          grid[idx1][idx2] = Pawn.new("black", grid[idx1][idx2], nil)
        elsif idx1 == 6
          grid[idx1][idx2] = Pawn.new("white", grid[idx1][idx2], nil)
        elsif idx1 == 7
          case idx2
          when 0
            grid[idx1][idx2] = Rook.new("white", grid[idx1][idx2], nil)
          when 1
            grid[idx1][idx2] = Knight.new("white", grid[idx1][idx2], nil)
          when 2
            grid[idx1][idx2] = Bishop.new("white", grid[idx1][idx2], nil)
          when 3
            grid[idx1][idx2] = Queen.new("white", grid[idx1][idx2], nil)
          when 4
            grid[idx1][idx2] = King.new("white", grid[idx1][idx2], nil)
          when 5
            grid[idx1][idx2] = Bishop.new("white", grid[idx1][idx2], nil)
          when 6
            grid[idx1][idx2] = Knight.new("white", grid[idx1][idx2], nil)
          when 7
            grid[idx1][idx2] = Rook.new("white", grid[idx1][idx2], nil)
          end
        else
          grid[idx1][idx2] = NullPiece.instance
        end
      end
    end
    grid
  end

end
a = Board.new
a.rows
b = a.dup(a.rows)
b[0][1] = "k"
puts b[0][1]
puts a.rows[0][1]

p b[0][2].board = 'hi'
puts a.rows[0][2].board
