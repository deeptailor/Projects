require_relative 'piece'

class Pawn < Piece
  def initialize (color, letter, pos, board)
    super
  end
  def moves
    vert1_black = [self.pos[0], self.pos[1] + 1]
    vert2_black = [self.pos[0], self.pos[1] + 2]
    diag1_black = [self.pos[0] + 1, self.pos[1] + 1]
    diag2_black = [self.pos[0] - 1, self.pos[1] + 1]
    vert1_white = [self.pos[0], self.pos[1] - 1]
    vert2_white = [self.pos[0], self.pos[1] - 2]
    diag1_white = [self.pos[0] + 1, self.pos[1] - 1]
    diag2_white = [self.pos[0] - 1, self.pos[1] - 1]
    if self.pos[1] == 1 && self.color == 'black'
      if board[*diag1_black].is_a?(Piece) || board[*diag2_black].is_a?(Piece)
        return vert1_black + vert2_black + diagonal1_black
      else
        return vert1_black + vert2_black
      end
    elsif self.pos[1] == 6 && self.color == 'white'
      if board[*diag1_white].is_a?(Piece) || board[*diag2_white].is_a?(Piece)
        return vert1_white + vert2_white + diagonal1_white
      else
        return vert1_white + vert2_white
      end
    else
      if self.color == 'black'
        if board[*diag1_black].is_a?(Piece) || board[*diag2_black].is_a?(Piece)
          return vert1_black + diag1_black + diag2_black
        else
          return vert1_black
        end
      else self.color == 'white'
        if board[*diag1_white].is_a?(Piece) || board[*diag2_white].is_a?(Piece)
          return vert1_white + diag1_white + diag2_white
        else
          return vert1_white
        end
      end
    end
  end
end
