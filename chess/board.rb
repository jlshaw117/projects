require_relative "piece"
require "byebug"

class Board
  attr_reader :grid

  def self.empty_board(board)
    board.each_pos do |pos|
      board[pos] = NullPiece.instance
    end
  end

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    Board.empty_board(self)
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row, col = pos
    @grid[row][col] = value
  end

  def each_pos(&prc)
    # debugger
    (0..7).each do |row|
      (0..7).each do |col|
        prc.call([row,col])
      end
    end
    nil
  end
end
