require_relative "piece"

class Pawn < Piece

  def initialize(color, board, pos)
    super
    @symbol = :P  
  end

  def moves(pos, board)
    if color == :B  
      mod = 1
    else
      mod = -1
    end

    moves = [] 
    
    forward = [pos[0]+(1 * mod), pos[1]] 
    moves << forward if !board[forward].nil? && board[forward].empty?

    if at_start_row?
      moves << [pos[0]+(2 * mod), pos[1]]
    end

    diagonal_1 = [pos[0]+(1 * mod), pos[1] + 1] 
    moves << diagonal_1 if !board[diagonal_1].nil? && !board[diagonal_1].empty?
   
    diagonal_2 = [pos[0]+(1 * mod), pos[1] - 1] 
    moves << diagonal_2 if !board[diagonal_2].nil? && !board[diagonal_2].empty?
    
    moves
  end
  
  def at_start_row?
    if color == :B
      pos.first == 1
    else
      pos.first == 6
    end
  end 
end