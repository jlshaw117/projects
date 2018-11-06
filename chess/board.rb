require_relative "piece"
require_relative "display"
require "byebug"

class Board
  attr_accessor :grid

  def self.empty_board(board)
    board.each_pos do |pos|
      board[pos] = NullPiece.instance
    end
  end

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    Board.empty_board(self)


    self[[0,0]] = Queen.new(:white, self, [0,0])
    self[[0,2]] = Queen.new(:white, self, [0,0])
    self[[2,0]] = Queen.new(:white, self, [0,0])
    p self[[0,0]].valid_moves
    nil
  end

  def valid_pos?(pos)
    pos.all? {|num| (0..7).include?(num)}
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "Invalid move" if self[start_pos].nil?
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
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
