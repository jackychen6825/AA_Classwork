require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = "clear"
    @symbol = :_
  end

  def empty?
    true 
  end 

  def moves 
    [] 
  end 

end