require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], Board.new)
  end

  def render
    system("clear")
    puts "  #{('a'..'h').to_a.join(' ')}"
    @cursor.board.rows.each_with_index do |row, idx|
      print "#{idx+1} "
      row.each_with_index do |col, idx2|
        if [idx,idx2] == @cursor.cursor_pos
          print '  '.colorize(:background => :red)
        else
          if idx.even?
            if idx2.even?
              print '  '.colorize(:background => :white)
            else
              print '  '.colorize(:background => :black)
            end
          else
            if idx2.odd?
              print '  '.colorize(:background => :white)
            else
              print '  '.colorize(:background => :black)
            end
          end
        end
      end
      puts " #{idx+1}"
    end
    puts "  #{('a'..'h').to_a.join(' ')}"
  end

  def display_cursor
    while true
      render
      @cursor.get_input
    end
  end
end
d = Display.new("test")
d.display_cursor
