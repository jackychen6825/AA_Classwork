module Slideable
  
  def moves(pos, board)

    o_moves = []
    orthagonal_dirs.each do |dir|
      o_moves += grow_unblocked_moves(pos, dir, board)
    end 

    d_moves = []
    diagonal_dirs.each do |dir|
      d_dirs += grow_unblocked_moves(pos, dir, board)
    end 

    o_moves + d_moves 

  end

  def orthagonal_dirs
    [[0,1], [0,-1],[-1,0], [1,0]]
  end

  def diagonal_dirs
    [[1,1], [-1,1],[1,-1], [-1,-1]]
  end

  def grow_unblocked_moves(pos, dir, board)

    unblocked = []
    move = pos.dup 
    8.times do 
      row = move[0] + dir[0] 
      col = move[1] + dir[1]
      move = [row, col]
      unblocked.push(move)
      break unless board[move].nil? 
    end 

  end


end