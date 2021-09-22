require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @symbol = :Q
  end

  def moves_dirs
    [[0,1], [0,-1],[-1,0], [1,0],[1,1], [-1,1],[1,-1], [-1,-1]]
  end



end

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @symbol = :R
  end

  def moves_dirs
    [[0,1], [0,-1],[-1,0], [1,0]]
  end
  
end

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    @symbol = :B
  end

  def moves_dirs
    [[1,1], [-1,1],[1,-1], [-1,-1]]
  end
  
end