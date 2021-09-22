
require_relative "board"
require_relative "cursor"
require "colorize"

class Display 
  attr_reader :board 
  attr_accessor :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([5,5], board)
  end

  def render 
    system("clear")
    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        if cursor.cursor_pos == pos 
          print board[pos].to_s.colorize(:yellow) + " "
        else
          print board[pos].to_s + " "
        end
      end
      puts  
    end 
  end 

end

b = Board.new
d = Display.new(b)

while true
  sleep(1)
  d.render
  p d.cursor.get_input
end 