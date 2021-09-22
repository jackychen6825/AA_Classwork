
require_relative "board"
require_relative "cursor"

class Display 
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render 
    board.rows.each do |row|
      puts row.join(" ") 
    end
    cursor.get_input 

  end 

end

b = Board.new
d = Display.new(b)
d.render