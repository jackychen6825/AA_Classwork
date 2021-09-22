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
    row, col = pos

    8.times do 
      [move[0]+row, move[1]+col]
    end 


  end


end