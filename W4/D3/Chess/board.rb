require_relative "knight_king"
require_relative "queen_rook_bishop"
require_relative "null_piece"
require_relative "pawn"


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
  
    pieces = [ 
      Queen.new(:blue, self, [0,3]),
      Queen.new(:red, self, [7,3]),
      King.new(:blue, self, [0,4]),
      King.new(:red, self, [7,4]),
      Rook.new(:blue, self, [0,0]),
      Rook.new(:blue, self, [0,7]),
      Rook.new(:red, self, [7,0]),
      Rook.new(:red, self, [7,7]),
      Knight.new(:blue, self, [0,1]),
      Knight.new(:blue, self, [0,6]),
      Knight.new(:red, self, [7,1]),
      Knight.new(:red, self, [7,6]),
      Bishop.new(:blue, self, [0,2]),
      Bishop.new(:blue, self, [0,5]),
      Bishop.new(:red, self, [7,2]),
      Bishop.new(:red, self, [7,5]),
    ]
    (0...8).each do |col|
      pieces << Pawn.new(:blue, self, [1, col])
    end
    (0...8).each do |col|
      pieces << Pawn.new(:red, self, [6, col])
    end

    pieces

  end 


  def kings_pos(color)

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        return pos if self[pos].is_a?(King) && self[pos].color == color 
      end 
    end 

  end 

  def in_check?(color, k_pos=nil)
    
    k_pos ||= kings_pos(color)

    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        return true if self[pos].valid_moves.include?(k_pos) && self[pos].color != color
      end 
    end 
    false 
  end 

  def check_mate?(color)
    if in_check?(color)
      board[kings_pos(color)].valid_moves.all? do |poss_pos|
        in_check?(color, poss_pos)
      end
    else 
      false  
    end 
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
    piece.pos = end_pos
  end 

  
end

