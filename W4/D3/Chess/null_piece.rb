require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :white
    @symbol = :_
  end

  def empty?
    true 
  end 

  def moves 
    [] 
  end 

end