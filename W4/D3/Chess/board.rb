require_relative "piece"

class Board

  attr_accessor :rows 

  def initialize
    # middle = Array.new(4) do 
    #    Array.new(8)
    # end 

    # pieces_placed = Array.new(2) do 
    #   Array.new(8) {Piece.new()}
    # end 

    @rows = Array.new(8) {Array.new(8)} 
    pieces.each do |piece|
      add_piece(piece, piece.pos)
    end 
    @null_piece = nil 
  end


  def pieces
    pieces_arr = []

    (0...2).each do |i|
      (0...8).each do |j|
        pos = [i, j]
        pieces_arr << Piece.new(:W, self, pos)
      end 
    end 

    (6...8).each do |i|
      (0...8).each do |j|
        pos = [i, j]
        pieces_arr << Piece.new(:B, self, pos)
      end 
    end 

    pieces_arr
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
    raise "No peice at start pos" if self[start_pos].nil?
    piece = self[start_pos]
    raise "Invalid end position" unless piece.valid_moves.include?(end_pos)
    self[start_pos] = nil 
    self[end_pos] = piece
  end 

end

