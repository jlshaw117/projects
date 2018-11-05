require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :nothing
    @board = nil
    @pos = nil
  end

  def symbol
    " "
  end
end
