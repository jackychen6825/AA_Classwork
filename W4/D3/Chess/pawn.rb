require_relative "piece"

class Pawn < Piece
  attr_accessor :start_row

  def initialize(color, board, pos)
    super
    @symbol = :P  
    @start_row = true 
  end

  def moves(pos, board)
    moves = [] 
    moves << [pos[0]+(1 * mod), pos[1]] 
    if at_start_row?
      moves << [pos[0]+(2 * mod), pos[1]]
    end

    diagonal_1 = [pos[0]+(1 * mod), pos[1] + 1] 
    

    diagonal_2 = [pos[0]+(-1 * mod), pos[1] - 1] 

  end
  
  def at_start_row?
    @start_row
  end 
end