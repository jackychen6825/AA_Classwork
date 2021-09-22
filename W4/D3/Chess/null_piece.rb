require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :magenta
    @symbol = :_
  end

  def empty?
    true 
  end 

  def moves 
    [] 
  end 

end