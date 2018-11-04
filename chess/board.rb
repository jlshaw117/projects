require_relative "piece"
 
class Board
  attr_reader :grid

  def self.empty_board(board)
    board.each do |pos|
      board[pos] = NullPiece.instance
    end
  end

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    Board.empty(self)
  end

  def each_pos(&prc)
    @grid.each_index do |row|
      @row.each_index do |col|
        prc.call([row,col])
      end
    end
    nil
  end
end
