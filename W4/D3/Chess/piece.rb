class Piece
  attr_reader :color, :board, :pos
  
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

  end

  def valid_moves
    v_moves = []
    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        # if board[pos].color != color || board[pos].empty?
        if board[pos].nil? || board[pos].color != color
          v_moves << pos
        end
      end
    end
    v_moves
  end

  def empty?
    false
  end

  def inspect 
    color
  end

end