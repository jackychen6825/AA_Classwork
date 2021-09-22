require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    mark = self.next_mover_mark
    possible_moves = []
    (0...3).each do |row|
      (0...3).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          possible_board = board.dup
          prev_move_pos = pos
          possible_board[pos] = mark
          possible_moves << possible_board
        end
      end
    end
    possible_moves
  end
end
