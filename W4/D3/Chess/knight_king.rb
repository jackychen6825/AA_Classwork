require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
    @symbol = :N
  end

  def moves_diff
    [
      [-2, -1]
      [-2, 1]
      [2, -1]
      [2, 1]
      [-1, 2]
      [1, 2]
      [-1, -2]
      [1, -2]
    ]
  end

end

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
    @symbol = :K
  end

  def moves_diff
    [
      [-1, -1]
      [-1, 0]
      [-1, 1]
      [0, 1]
      [1, 1]
      [1, 0]
      [1, -1]
      [0, -1]
    ]
  end

end