require_relative "knight_king"
require_relative "queen_rook_bishop"
require_relative "null_piece"


class Board

  attr_accessor :rows 

  def initialize
    # middle = Array.new(4) do 
    #    Array.new(8)
    # end 

    # pieces_placed = Array.new(2) do 
    #   Array.new(8) {Piece.new()}
    # end 

    @rows = Array.new(8) {Array.new(8, NullPiece.instance)} 
    pieces.each do |piece|
      add_piece(piece, piece.pos)
    end  
  end


  def pieces
  
    [ 
      Queen.new(:B, self, [0,3]),
      Queen.new(:W, self, [7,3]),
      King.new(:B, self, [0,4]),
      King.new(:W, self, [7,4]),
      Rook.new(:B, self, [0,0]),
      Rook.new(:B, self, [0,7]),
      Rook.new(:W, self, [7,0]),
      Rook.new(:W, self, [7,7]),
      Knight.new(:B, self, [0,1]),
      Knight.new(:B, self, [0,6]),
      Knight.new(:W, self, [7,1]),
      Knight.new(:W, self, [7,6]),
      Bishop.new(:B, self, [0,2]),
      Bishop.new(:B, self, [0,5]),
      Bishop.new(:W, self, [7,2]),
      Bishop.new(:W, self, [7,5]),
    ]

  end 

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(color, start_pos, end_pos)
    raise "No peice at start pos" if self[start_pos].empty?
    piece = self[start_pos]
    raise "Invalid end position" unless piece.valid_moves.include?(end_pos)
    # debugger
    self[start_pos] = NullPiece.instance() 
    self[end_pos] = piece
  end 

end

