require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable

  attr_reader :symbol
  def initialize(color, board, pos)
    super
    @symbol = :Q
  end

  
  
end