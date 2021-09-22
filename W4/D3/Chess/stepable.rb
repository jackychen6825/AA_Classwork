module Stepable

  def moves(pos)
    row, col = pos
    moves_diff.map do |move|
      [move[0]+row, move[1]+col]
    end
  end

  private 
  def moves_diff
    #[[2,1],[2,-1],[1,2]]
  end

end