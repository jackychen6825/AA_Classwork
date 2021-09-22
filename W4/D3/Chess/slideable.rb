require "byebug"

module Slideable
  
  def moves(pos, board)

    moves = []
    debugger
    moves_dirs.each do |dir|
      moves.concat(grow_unblocked_moves(pos, dir, board))
    end 
    moves

  end

  
  # def diagonal_dirs
  #   [[1,1], [-1,1],[1,-1], [-1,-1]]
  # end
  
  def grow_unblocked_moves(pos, dir, board)
    debugger
    unblocked = []
    move = pos.dup 
    8.times do 
      row = move[0] + dir[0]
      col = move[1] + dir[1]
      move = [row, col]
      unblocked.push(move)
      break unless board[move].nil? 
    end 
    unblocked
  end

  private
  def moves_dirs
    # [[0,1], [0,-1],[-1,0], [1,0],[1,1], [-1,1],[1,-1], [-1,-1]]
  end
  
end