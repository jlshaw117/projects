require_relative "sliding_piece"

class Queen < Piece
  include SlidingPiece

  def symbol
    color == :white ? "♕" : "♛"
  end

  protected

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end
