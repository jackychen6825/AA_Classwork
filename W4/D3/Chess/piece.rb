class Piece
  attr_reader :color, :board, :pos, :symbol
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @symbol = :G 

  end

  def valid_moves
    v_moves = []
    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        # if board[pos].color != color || board[pos].empty?
        if board[pos].empty? || board[pos].color != color
          v_moves << pos
        end
      end
    end
    v_moves & moves(pos, board) 
  end

  def empty?
    false
  end

  def inspect 
    symbol
  end

  private 
  def moves(pos, board)
    []
  end 
end