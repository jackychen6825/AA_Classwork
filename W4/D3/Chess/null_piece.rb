require "singleton"

class NullPiece < Piece
include Singleton
def initialize
  super
end


end